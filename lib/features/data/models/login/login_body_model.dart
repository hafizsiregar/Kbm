import 'package:equatable/equatable.dart';
import 'package:kbm/features/domain/entities/login_body.dart';

class LoginBodyModel extends Equatable {
  final String email;
  final String password;

  const LoginBodyModel({
    required this.email,
    required this.password,
  });

  factory LoginBodyModel.fromJson(Map<String, dynamic> json) => LoginBodyModel(
    email: json["email"], 
    password: json["password"]
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password
  };

  LoginBody toEntity() {
    return LoginBody(email: email, password: password);
  }

  @override
  List<Object?> get props => [
    email,
    password,
  ];
}