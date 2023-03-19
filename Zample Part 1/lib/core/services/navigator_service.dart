import 'package:flutter/cupertino.dart';
import 'package:zample/components/home/ui/home_screen.dart';
import 'package:zample/components/landing/ui/landing_page.dart';
import 'package:zample/core/bloc/repo/firebase_auth_repository.dart';
import 'package:zample/core/services/service_locator.dart';

/// Determines the [RouteType] / transition for the new Route
enum RouteType {
  defaultRoute,
}

/// The [NavigatorService] contains the [Navigator] key used by the root of [MaterialApp]
/// Allows the navigation without access to the [BuildContext]
class NavigatorService {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  /// Observes the current state of the [Route]
  final RouteObserver<PageRoute<dynamic>> routeObserver =
      RouteObserver<PageRoute<dynamic>>();

  NavigatorState? get state => key.currentState;
  late String initialRoute;

  /// checks whether the user is authenticated - if not the [initialRoute] is [LandingScreen]
  NavigatorService() {
    initialRoute = app.get<FirebaseAuthRepository>().getCurrentUser() != null
        ? HomeScreen.route
        : LandingScreen.route;
  }

  /// method to push a new [Route] to the [Navigator]
  void pushRoute(Route<void> route) {
    key.currentState!.push<void>(route);
  }

  /// method to push a new named replacement [Route]
  void pushReplacementNamed(String route,
      {RouteType type = RouteType.defaultRoute,
      Map<String, dynamic>? arguments}) {
    key.currentState
        ?.pushReplacementNamed<void, void>(route, arguments: <String, dynamic>{
      'routeType': type,
      ...?arguments,
    });
  }

  /// A convenience method to push a named route.
  void pushNamed(
    String route, {
    RouteType type = RouteType.defaultRoute,
    Map<String, dynamic>? arguments,
  }) {
    key.currentState?.pushNamed<void>(
      route,
      arguments: <String, dynamic>{
        'routeType': type,
      }..addAll(arguments ?? {}),
    );
  }

  /// [onGenerateRoute] is called whenever a new named route is being pushed to
  /// the app.
  ///
  /// The [RouteSettings.arguments] that can be passed along the named route
  /// needs to be a `Map<String, dynamic>` and can be used to pass along
  /// arguments for the screen.
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;

    final arguments = settings.arguments as Map<String, dynamic>?;

    final routeType = arguments?['routeType'] as RouteType?;
    Widget screen;

    switch (routeName) {
      case LandingScreen.route:
        screen = const LandingScreen();
        break;
      case HomeScreen.route:
        screen = HomeScreen();
        break;
      default:
        screen = HomeScreen();
        break;
    }

    switch (routeType) {
      case RouteType.defaultRoute:
      default:
        return CupertinoPageRoute<void>(
          builder: (_) => screen,
          settings: RouteSettings(name: routeName, arguments: arguments),
        );
    }
  }
}
