import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/service_locator.dart';
import '../auth/auth_cubit.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthCubit _authCubit = app.get<AuthCubit>();

  AppCubit() : super(const AppState());

  Future<void> initializeApp() async {
    emit(state.copyWith(loading: true));

    try {
      /// initialize authentication with [AuthCubit]
      _authCubit.initialize();
    } catch (e) {
      emit(state.copyWith(errorMsg: e.toString()));
    }
    emit(state.copyWith(loading: false));
  }
}
