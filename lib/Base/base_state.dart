import 'package:e_commerce/Base/enums/base_screen_state.dart';

class BaseState{
  String? errorMessage;
  BaseScreenState state;

  BaseState({this.errorMessage , this.state = BaseScreenState.notInitialized});
}