import 'package:e_commerce/UI/Screens/Main/Main%20Screen%20View%20Model/main_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class MainScreenViewModel extends Cubit<MainScreenState> {

  MainScreenViewModel() : super(MainScreenState(currentSelectedTab: 0));

  void setNewTab(int newIndex){
    emit(state.copyWith(currentSelectedTab: newIndex));
  }
}