import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kbm/core/service/network_info.dart';
import 'package:kbm/features/data/data_sources/auth/auth_remote_data_source.dart';
import 'package:kbm/features/data/models/login/login_body_model.dart';
import 'package:kbm/features/data/models/login/login_response_model.dart';
import 'package:kbm/features/domain/repositories/auth/auth_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data_api_failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  String getErrorMessageFromEndpoint(dynamic dynamicErrorMessage, String httpErrorMessage, int statusCode) {
    if (dynamicErrorMessage is Map &&
        dynamicErrorMessage.containsKey('message') &&
        dynamicErrorMessage['message'].isNotEmpty) {
      return '$statusCode ' + dynamicErrorMessage['message'];
    } else if (dynamicErrorMessage is String) {
      return httpErrorMessage;
    } else {
      return httpErrorMessage;
    }
  }

  @override
  Future<Either<Failure, LoginResponseModel>> login(
    {required String email, required String password}
  ) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        var response = await authRemoteDataSource.login(
          email: email,
          password: password,
        );
        return Right(response);
      } on DioError catch (error) {
        if (error.response == null) {
          return Left(ServerFailure(DataApiFailure(message: error.message)));
        }
        var errorMessage = getErrorMessageFromEndpoint(
          error.response?.data,
          error.message,
          error.response?.statusCode ?? 400,
        );
        return Left(ServerFailure(DataApiFailure(
          message: errorMessage,
          statusCode: error.response?.statusCode,
          httpMessage: error.message,
        )));
      } on TypeError catch (error) {
        return Left(ParsingFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure("Gagal Login"));
    }
  }
}