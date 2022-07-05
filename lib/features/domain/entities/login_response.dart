import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String tokenType;
  final String accessToken;
  final String message;

  const LoginResponse({
    required this.tokenType,
    required this.accessToken,
    required this.message,
  });

  @override
  List<Object?> get props => [
    tokenType,
    accessToken,
    message,
  ];
}