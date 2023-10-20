import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parctice2_app/blocs/task_cubit/task_cubit.dart';
import 'package:parctice2_app/constants/routes.dart';
import 'package:parctice2_app/screens/prescription_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (BuildContext context) => TaskCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: Home.routeName,
      ),
    );
  }
}

class Home extends StatelessWidget {
  static const routeName = '/home-home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, PrescrptionScreen.routeNNNN);
          },
          child: const Text('Create Pdf'),
        ),
      ),
    );
  }
}
