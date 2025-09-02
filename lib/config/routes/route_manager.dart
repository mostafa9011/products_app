import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/screens/favorite_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import 'page_name.dart';

class RouteManager {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext currentContext = navigatorKey.currentState!.context;

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case PageName.homeScreen:
        return _getPageTransition(
          const HomeScreen(),
          settings: routeSettings,
        );

      case PageName.loginScreen:
        return _getPageTransition(
          const LoginScreen(),
          settings: routeSettings,
        );

      case PageName.favoriteScreen:
        final homeBloc = routeSettings.arguments as HomeBloc;

        return _getPageTransition(
          FavoriteScreen(
            homeBloc: homeBloc,
          ),
          settings: routeSettings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }

  // ignore: unused_element
  static PageTransition<dynamic> _getPageTransition(
    Widget screen, {
    RouteSettings? settings,
  }) {
    return PageTransition(
      child: screen,
      type: PageTransitionType.fade,
      curve: Curves.easeOut,
      reverseDuration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
      settings: settings,
    );
  }
}
