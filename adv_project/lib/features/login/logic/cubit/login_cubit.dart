import 'package:adv_project/features/login/data/models/login_request_body.dart';
import 'package:adv_project/features/login/data/repos/login_repo.dart';
import 'package:adv_project/features/login/logic/cubit/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);

    response.when(success: (LoginResponse) {
      emit(LoginState.success(LoginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
