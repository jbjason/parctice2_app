import 'package:flutter/material.dart';
import 'package:parctice2_app/screens/home_screen.dart';
import 'package:parctice2_app/screens/doc_details_screen.dart';
import 'package:parctice2_app/screens/soow_home.dart';
import 'package:parctice2_app/screens/video_call_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case SooHome.routeName:
        return MaterialPageRoute(builder: (context) => const SooHome());

      case DocDetailsScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const DocDetailsScreen());

      case VideoCallScreen.routeName:
        return MaterialPageRoute(builder: (context) => const VideoCallScreen());

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
