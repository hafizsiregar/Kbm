import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'message')
  final String? message;

  const LoginResponse({
    required this.tokenType,
    required this.accessToken,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  List<Object?> get props => [
    tokenType,
    accessToken,
    message,
  ];

  @override
  String toString() {
    return 'LoginResponse{tokenType: $tokenType, accessToken: $accessToken, message: $message}';
  }
}