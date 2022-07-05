import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kbm/config/base_url_config.dart';
import 'package:kbm/features/data/models/login/login_body_model.dart';
import '../../models/login/login_response_model.dart';

abstract class AuthRemoteDataSource {
  /// Panggil endpoint [BaseUrlConfig.AuthEndpoint]/api/auth/token
  /// 
  /// Throws [DioError] untuk semua kode erroe
  Future<LoginResponseModel> login({
    required String email, 
    required String password
  });
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
  Future<LoginResponseModel> login({
    required String email,
    required String password
  }) async {
    final path = '$baseUrl/login';
    final body = jsonEncode({
      "email": email,
      "password": password
    });
    final response = await dio.post(
      path,
      data: body,
    );
    print(response.data);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(data);
      loginResponseModel.tokenType = 'Bearer ' + ' ' 'access_token';
      return loginResponseModel;
    } else {
      throw DioError(requestOptions: RequestOptions(path: 'Error to login'));
  }}
}