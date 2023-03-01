import 'package:flutter/material.dart';
import 'package:parctice2_app/screens/home_screen.dart';
import 'package:parctice2_app/screens/welcome_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case WelcomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());

      // case HomeScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => AuthCubit(),
      //       child: const HomeScreen(),
      //     ),
      //   );
      default:
        null;
    }
    return null;
  }
}
