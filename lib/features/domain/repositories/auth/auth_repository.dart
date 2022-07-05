import 'package:dartz/dartz.dart';
import 'package:kbm/core/error/failure.dart';
import 'package:kbm/features/data/models/login/login_body_model.dart';
import 'package:kbm/features/data/models/login/login_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> login(
    {required String email, required String password}
  );
}