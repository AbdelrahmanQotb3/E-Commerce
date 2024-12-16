import 'package:e_commerce/Base/base_state.dart';
import 'package:e_commerce/Base/enums/base_screen_state.dart';
import 'package:e_commerce/Data/Repositories/AuthRepositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<BaseState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthRepository authRepository;

  LoginViewModel(this.authRepository)
      : super(BaseState(state: BaseScreenState.notInitialized));

  void Login() async {
    if (!formKey.currentState!.validate()) return;
    try {
      emit(BaseState(state: BaseScreenState.loading));
      await authRepository.Login(nameController.text, passwordController.text);
      emit(BaseState(state: BaseScreenState.success));
      print("emit Success has been done");
    } catch (exception) {
      emit(BaseState(
          state: BaseScreenState.failure, errorMessage: exception.toString()));
    }
  }
}
