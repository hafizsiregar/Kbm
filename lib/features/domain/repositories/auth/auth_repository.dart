import 'package:dartz/dartz.dart';
import 'package:kbm/core/error/failure.dart';
import 'package:kbm/features/data/models/login/login_body.dart';
import 'package:kbm/features/data/models/login/login_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(
    LoginBody loginBody
  );
}