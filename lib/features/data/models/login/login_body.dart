import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable()
class LoginBody extends Equatable {
  final String email;
  final String password;

  const LoginBody({
    required this.email,
    required this.password,
  });

  factory LoginBody.fromJson(Map<String, dynamic> json) => _$LoginBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);

  @override
  List<Object?> get props => [
    email,
    password,
  ];

  @override
  String toString() {
    return 'LoginBody{email: $email, password: $password}';
  }
}