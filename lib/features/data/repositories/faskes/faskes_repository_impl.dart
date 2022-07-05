import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kbm/features/data/data_api_failure.dart';
import 'package:kbm/features/data/data_sources/faskes/faskes_remote_data_source.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/service/network_info.dart';
import '../../../domain/entities/faskes.dart';
import '../../../domain/repositories/faskes/faskes_repository.dart';

class FaskesRepositoryImpl implements FaskesRepository {
  final FaskesRemoteDataSource faskesRemoteDataSource;
  final NetworkInfo networkInfo;

  FaskesRepositoryImpl({
    required this.faskesRemoteDataSource,
    required this.networkInfo,
  });

  String getErrorMessageFromEndpoint(
      dynamic dynamicErrorMessage, String httpErrorMessage, int statusCode) {
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
  Future<Either<Failure, List<Faskes>>> getListAllFaskes() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await faskesRemoteDataSource.getListAllFaskes();
        // print(response.toString());
        return Right(response.map((e) => e.toEntity()).toList());
      } on DioError catch (error) {
        if (error.response == null) {
          return Left(
            ServerFailure(
              DataApiFailure(
                message: error.message,
              ),
            ),
          );
        }
        var errorMessage = getErrorMessageFromEndpoint(
          error.response?.data,
          error.message,
          error.response?.statusCode ?? 400,
        );
        return Left(
          ServerFailure(
            DataApiFailure(
              message: errorMessage,
              statusCode: error.response?.statusCode,
              httpMessage: error.message,
            ),
          ),
        );
      } on TypeError catch (error) {
        return Left(ParsingFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Faskes>>> getListHospitals() async {
    final isConnected = await networkInfo.isConnected;
    if(isConnected) {
      try {
        final response = await faskesRemoteDataSource.getListHospitals();
        // print(response.toString());
        return Right(response.map((e) => e.toEntity()).toList());
      } on DioError catch (error) {
        if (error.response == null) {
          return Left(
            ServerFailure(
              DataApiFailure(
                message: error.message,
              ),
            ),
          );
        }
        var errorMessage = getErrorMessageFromEndpoint(
          error.response?.data,
          error.message,
          error.response?.statusCode ?? 400,
        );
        return Left(
          ServerFailure(
            DataApiFailure(
              message: errorMessage,
              statusCode: error.response?.statusCode,
              httpMessage: error.message,
            ),
          ),
        );
      } on TypeError catch (error) {
        return Left(ParsingFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Faskes>>> getListClinic() async {
    final isConnected = await networkInfo.isConnected;
    if(isConnected) {
      try {
        final response = await faskesRemoteDataSource.getListClinic();
        // print(response.toString());
        return Right(response.map((e) => e.toEntity()).toList());
      } on DioError catch (error) {
        if (error.response == null) {
          return Left(
            ServerFailure(
              DataApiFailure(
                message: error.message,
              ),
            ),
          );
        }
        var errorMessage = getErrorMessageFromEndpoint(
          error.response?.data,
          error.message,
          error.response?.statusCode ?? 400,
        );
        return Left(
          ServerFailure(
            DataApiFailure(
              message: errorMessage,
              statusCode: error.response?.statusCode,
              httpMessage: error.message,
            ),
          ),
        );
      } on TypeError catch (error) {
        return Left(ParsingFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure('No internet connection'));
    }
  }
}
