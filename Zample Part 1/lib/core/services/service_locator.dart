import 'package:get_it/get_it.dart';
import 'package:zample/components/home/bloc/home_cubit.dart';
import 'package:zample/components/landing/bloc/social_links_cubit.dart';
import 'package:zample/components/profile/firebase_profile_repository.dart';
import 'package:zample/core/bloc/app/app_cubit.dart';
import 'package:zample/core/bloc/auth/auth_cubit.dart';
import 'package:zample/core/bloc/repo/firebase_auth_repository.dart';
import 'package:zample/core/services/navigator_service.dart';

final GetIt app = GetIt.instance;

/// initializes all necessary services with [Get-it]
void setupServices() {
  app
    ..registerLazySingleton<FirebaseAuthRepository>(
        () => FirebaseAuthRepository())
    ..registerLazySingleton<NavigatorService>(() => NavigatorService())
    ..registerLazySingleton<AuthCubit>(() => AuthCubit())
    ..registerLazySingleton<FirebaseProfileRepository>(
        () => FirebaseProfileRepository())
    ..registerLazySingleton<AppCubit>(() => AppCubit())
    ..registerLazySingleton<SocialLinksCubit>(() => SocialLinksCubit())
    ..registerLazySingleton<HomeCubit>(() => HomeCubit());
}
