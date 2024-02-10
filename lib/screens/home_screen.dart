import 'package:flutter/material.dart';
import 'package:parctice2_app/screens/book_lawyer_screen.dart';
import 'package:parctice2_app/screens/book_pet_travel_screen.dart';
import 'package:parctice2_app/screens/book_photograph_screen.dart';
import 'package:parctice2_app/screens/book_taxi_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF6FF),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[800]!,
              Colors.grey[850]!,
              Colors.grey[900]!,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, BookPetTravelScreen.routeName);
              },
              child: const Text("Book Pet Travel"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, BookPhotographScreen.routeName);
              },
              child: const Text("Book Photograph"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, BookLawyerScreen.routeName);
              },
              child: const Text("Book Lawyer"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, BookTaxiScreen.routeName);
              },
              child: const Text("Book Taxi"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
