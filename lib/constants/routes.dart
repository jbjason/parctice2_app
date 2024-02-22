import 'package:flutter/material.dart';
import 'package:parctice2_app/screens/book_lawyer_screen.dart';
import 'package:parctice2_app/screens/book_pet_travel_screen.dart';
import 'package:parctice2_app/screens/book_photograph_screen.dart';
import 'package:parctice2_app/screens/book_taxi_screen.dart';
import 'package:parctice2_app/screens/home_screen.dart';
import 'package:parctice2_app/screens/test_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case TestScreen.routeName:
        return MaterialPageRoute(builder: (context) => const TestScreen());

      case BookPetTravelScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const BookPetTravelScreen());

      case BookPhotographScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const BookPhotographScreen());

      case BookLawyerScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const BookLawyerScreen());

      case BookTaxiScreen.routeName:
        return MaterialPageRoute(builder: (context) => const BookTaxiScreen());

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
