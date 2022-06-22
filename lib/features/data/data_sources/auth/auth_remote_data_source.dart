import 'package:dio/dio.dart';
import 'package:kbm/config/base_url_config.dart';
import 'package:kbm/features/data/models/login/login_body.dart';
import '../../models/login/login_response.dart';

abstract class AuthRemoteDataSource {
  /// Panggil endpoint [BaseUrlConfig.AuthEndpoint]/api/auth/token
  /// 
  /// Throws [DioError] untuk semua kode erroe
  Future<LoginResponse> login(LoginBody loginBody);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  final Dio dioInterceptor;

  AuthRemoteDataSourceImpl({
    required this.dio, 
    required this.dioInterceptor
  });

  final baseUrl = BaseUrlConfig.baseUrlProductionPanelEndPoint;

  @override
  Future<LoginResponse> login(LoginBody loginBody) async {
    final response = await dio.post(
      '$baseUrl/api/login',
      data: loginBody.toJson(),
    );
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    } else {
      throw DioError(requestOptions: RequestOptions(path: 'Error to login'));
  }}
}