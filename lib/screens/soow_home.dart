import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const homeAppBar = Color(0xFF01204E);
const homeAppBar1 = Color.fromARGB(255, 38, 75, 131);
final homeGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    homeAppBar,
    homeAppBar1.withOpacity(.5),
    homeAppBar1.withOpacity(.05)
  ],
);

class SooHome extends StatefulWidget {
  static const routeName = '/soo-home';
  const SooHome({super.key});

  @override
  State<SooHome> createState() => _SooHomeState();
}

class _SooHomeState extends State<SooHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 10,
            title: Image.asset('assets/welcome_logo.png',
                height: 60, width: size.width * .4, fit: BoxFit.contain),
            actions: [
              IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.notifications_outlined, color: homeAppBar),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/people_logo.jpg'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(17),
              height: 57,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    'Search doctor',
                    style: TextStyle(
                      color: Color(0xFFE0E0E0),
                      fontSize: 14,
                      letterSpacing: 1.3,
                      wordSpacing: 1.5,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: homeGradient,
                        borderRadius: BorderRadius.circular(7)),
                    child: const Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
