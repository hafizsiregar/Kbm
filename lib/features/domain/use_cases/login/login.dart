import 'package:dartz/dartz.dart';
import 'package:kbm/features/data/models/login/login_body_model.dart';
import 'package:kbm/features/data/models/login/login_response_model.dart';
import 'package:kbm/features/domain/repositories/auth/auth_repository.dart';
import '../../../../core/error/failure.dart';

class Login {

  final AuthRepository repository;
  Login({
    required this.repository
  });

  Future<Either<Failure, LoginResponseModel>> call(
    {required String email, required String password}
    ) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}