import 'package:flutter/material.dart';
import 'package:zample/misc/theme/themes.dart';

import 'core/services/navigator_service.dart';
import 'core/services/service_locator.dart';

class Zample extends StatelessWidget {
  const Zample({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: MaterialApp(
        theme: darkTheme,
        debugShowCheckedModeBanner: false,

        /// Specializes [navigatorKey] for the whole application
        navigatorKey: app.get<NavigatorService>().key,

        ///  [onGenerateRoute] is called whenever a new named route is being pushed to the app
        onGenerateRoute: app.get<NavigatorService>().onGenerateRoute,

        /// Initialize [NavigatorService] initial Route, checks whether User is authenticated
        initialRoute: app.get<NavigatorService>().initialRoute,
      ),
      onWillPop: () async => false,
    );
  }
}
