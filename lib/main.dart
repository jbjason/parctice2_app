import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parctice2_app/blocs/switch_bloc/switch_bloc.dart';
import 'package:parctice2_app/blocs/task_bloc/task_bloc.dart';
import 'package:parctice2_app/constants/routes.dart';
import 'package:parctice2_app/constants/theme.dart';
import 'package:parctice2_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SwitchBloc>(
            lazy: false, create: (context) => SwitchBloc()),
        BlocProvider<TaskBloc>(lazy: false, create: (context) => TaskBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.isDarkTheme
                ? AppThemes.darkTheme()
                : AppThemes.lightTheme(),
            onGenerateRoute: Routes.onGenerateRoute,
            initialRoute: HomeScreen.routeName,
          );
        },
      ),
    );
  }
}
