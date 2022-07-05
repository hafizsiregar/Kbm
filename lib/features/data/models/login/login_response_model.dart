import 'package:equatable/equatable.dart';

import '../../../domain/entities/login_response.dart';

class LoginResponseModel extends Equatable {
  String tokenType;
  final String accessToken;
  final String message;

  LoginResponseModel({
    required this.tokenType,
    required this.accessToken,
    required this.message,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      tokenType: json["token_type"], 
      accessToken: json["access_token"], 
      message: json["message"]
    );
  }

  Map<String, dynamic> toJson() => {
    "token_type": tokenType,
    "accessToken": accessToken,
    "message": message
  };

  LoginResponse toEntity() {
    return LoginResponse(
      tokenType: tokenType, 
      accessToken: accessToken, 
      message: message
    );
  }  

  @override
  List<Object?> get props => [
    tokenType,
    accessToken,
    message,
  ];
}