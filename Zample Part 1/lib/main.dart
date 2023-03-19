import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:zample/zample.dart';

import 'core/bloc/global_bloc_provider.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Setup [Get-it] package with [Cubit]
  setupServices();

  /// Initialize [Firebase]
  await Firebase.initializeApp();

  /// Initialize [GlobalBlocProvider] with [MutliBlocProvider] with necessary [Blocs]
  runApp(const GlobalBlocProvider(
    child: Zample(),
  ));
}
