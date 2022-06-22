// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:kbm/core/use_cases/use_case.dart';
// import 'package:kbm/features/data/models/login/login_response.dart';
// import 'package:kbm/features/domain/repositories/auth/auth_repository.dart';
// import '../../../../core/error/failure.dart';
// import '../../../data/models/login/login_body.dart';

// class Login implements UseCase<LoginResponse, ParamsLogin> {
//   final AuthRepository authRepository;

//   Login({required this.authRepository});

//   @override
//   Future<Either<Failure, LoginResponse>> call(params) async {
//     return await authRepository.login(params.loginBody);
//   }
// }

// class ParamsLogin extends Equatable {
//   final LoginBody loginBody;

//   const ParamsLogin({required this.loginBody});

//   @override
//   List<Object?> get props => [loginBody];

//   @override
//   String toString() {
//     return 'ParamsLogin{loginBody: $loginBody}';
//   }
// }