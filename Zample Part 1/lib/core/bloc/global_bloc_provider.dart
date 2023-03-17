import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zample/components/home/bloc/home_cubit.dart';
import 'package:zample/components/landing/bloc/social_links_cubit.dart';

import '../services/service_locator.dart';
import 'app/app_cubit.dart';
import 'auth/auth_cubit.dart';

class GlobalBlocProvider extends StatelessWidget {
  const GlobalBlocProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      /* BlocProvider<AppCubit>.value(
        value: app.get<AppCubit>()..initializeApp(),
      ), */
      BlocProvider<AuthCubit>.value(
        value: app.get<AuthCubit>(),
      ),
      BlocProvider<SocialLinksCubit>.value(
        value: app.get<SocialLinksCubit>(),
      ),
      BlocProvider<HomeCubit>.value(
        value: app.get<HomeCubit>(),
      ),
    ], child: child);
  }
}
