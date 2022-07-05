import 'package:equatable/equatable.dart';

class LoginBody extends Equatable {
  final String email;
  final String password;

  LoginBody({
    required this.email,
    required this.password
  });

  @override
  List<Object> get props => [email, password];
}