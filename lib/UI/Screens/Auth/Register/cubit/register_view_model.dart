import 'package:e_commerce/Base/base_state.dart';
import 'package:e_commerce/Base/enums/base_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Data/Repositories/AuthRepositories/auth_repo.dart';

@injectable
class RegisterViewModel extends Cubit<BaseState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthRepository authRepository;

  RegisterViewModel(this.authRepository)
      : super(BaseState(state: BaseScreenState.notInitialized));

  void Register() async {
    if (!formKey.currentState!.validate()) return;
    try {
      emit(BaseState(state: BaseScreenState.loading));
      await authRepository.Register(
          userName: nameController.text,
          email: emailController.text,
          mobileNumber: mobileNumberController.text,
          password: passwordController.text,
          rePassword: confirmPasswordController.text);
      emit(BaseState(state: BaseScreenState.success));
    } catch (exception) {
      emit(BaseState(
          state: BaseScreenState.failure, errorMessage: exception.toString()));
    }
  }
}
