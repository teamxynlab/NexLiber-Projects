import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zample/components/home/ui/home_screen.dart';
import 'package:zample/components/landing/bloc/social_links_state.dart';
import 'package:zample/components/landing/ui/landing_page.dart';
import 'package:zample/core/bloc/auth/auth_cubit.dart';
import 'package:zample/core/bloc/repo/firebase_auth_repository.dart';

import '../../../core/services/navigator_service.dart';
import '../../../core/services/service_locator.dart';

class SocialLinksCubit extends Cubit<SocialLinksState> {
  final FirebaseAuthRepository firebaseAuthRepository =
      app.get<FirebaseAuthRepository>();
  final AuthCubit _authCubit = app.get<AuthCubit>();
  final NavigatorService _navigatorService = app.get<NavigatorService>();
  SocialLinksCubit() : super(const SocialLinksState());

  String error = "";

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(error: "", loading: true, authenticated: false));

    /// Tries to login with Google, if not possible [state] emits error
    try {
      final credentials = await firebaseAuthRepository.loginWithGoogle();
      await _authCubit.initialize();
      emit(state.copyWith(loading: false, authenticated: true));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        /// singular case: the accounts exists with different credentials
        case "account-exists-with-different-credential":
          error = "account-exists-with-different-credential";
          break;
      }
    } catch (e) {
      emit(state.copyWith(error: error, loading: false, authenticated: false));
    }
    _navigatorService.pushNamed(HomeScreen.route);
  }

  Future<void> noLogin() async {
    emit(state.copyWith(error: "", loading: true, authenticated: false));

    try {
      _navigatorService.pushReplacementNamed(HomeScreen.route);
    } catch (e) {
      emit(state.copyWith(
          error: e.toString(), loading: false, authenticated: false));
    }
    emit(state.copyWith(loading: false, authenticated: false));
  }

  Future<void> signOut() async {
    await firebaseAuthRepository.signOut();
    emit(state.copyWith(authenticated: false, loading: false));
    _navigatorService.pushReplacementNamed(LandingScreen.route);
  }
}
