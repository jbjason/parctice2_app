import 'package:flutter/material.dart';
import 'package:parctice2_app/main.dart';
import 'package:parctice2_app/screens/home_screen.dart';
import 'package:parctice2_app/screens/prescription_screen.dart';
import 'package:parctice2_app/screens/test_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case PrescrptionScreen.routeNNNN:
        return MaterialPageRoute(
            builder: (context) => const PrescrptionScreen());

      case Home.routeName:
        return MaterialPageRoute(builder: (context) => const Home());

      case TestScreen.routeName:
        return MaterialPageRoute(builder: (context) => const TestScreen());

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
