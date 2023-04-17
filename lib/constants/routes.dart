import 'package:flutter/material.dart';
import 'package:parctice2_app/screens/home_screen.dart';
import 'package:parctice2_app/screens/soow_description.dart';
import 'package:parctice2_app/screens/soow_home.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case SooHome.routeName:
        return MaterialPageRoute(builder: (context) => const SooHome());

      case SoowDescription.routeName:
        return MaterialPageRoute(builder: (context) => const SoowDescription());

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
