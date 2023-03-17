import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zample/components/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  void switchToTab(int index) {
    emit(HomeState(index: index));
  }
}
