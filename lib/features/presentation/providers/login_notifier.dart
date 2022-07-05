import 'package:flutter/material.dart';
import 'package:kbm/core/utils/enums/type_load_more.dart';
import 'package:kbm/features/data/models/login/login_response_model.dart';
import 'package:kbm/features/domain/repositories/auth/auth_repository.dart';

class LoginNotifier extends ChangeNotifier {
  
  final AuthRepository authRepository;
  LoginNotifier({required this.authRepository});

  LoginResponseModel? _loginResponseModel;
  LoginResponseModel? get loginResponseModel => _loginResponseModel;

  TypeLoadMore _loginState = TypeLoadMore.EMPTY;
  TypeLoadMore get loginState => _loginState;

  String _message = '';
  String get message => _message;

  // Future<bool> fetchLogin(
  //   String email, 
  //   String password
  // ) async {
  //   _loginState = TypeLoadMore.LOADING;
  //   notifyListeners();

  //   final result = await authRepository.login(email, password);
  //   result.fold(
  //     (failure) {
  //       _loginState = TypeLoadMore.FAILURE;
  //       _message = failure.message;
  //       notifyListeners();
  //     }, 
  //     (loginSuccess) {
  //       _loginState == TypeLoadMore.LOADED;
  //       _loginResponseModel = loginSuccess;
  //       notifyListeners();
  //     }
  //   );
  //   return false;
  // }
}