import 'package:flutter/material.dart';

const logBackColor = Color(0xFF060C22);
const logGradient1Color = Color(0xFF6502FE);
const logGradient2Color = Color(0xFFE71B6A);

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: logBackColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: AnimatedContainer(
              height: _isLogin ? size.height * .5 : size.height * .6,
              width: size.width * .8,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [logGradient1Color, logGradient2Color],
                ),
              ),
              child: ClipPath(
                clipper: AuthClipper(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                  decoration: BoxDecoration(
                    color: logBackColor,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        // login text
                        Center(
                          child: Text(
                            _isLogin ? 'LOGIN' : 'SIGNUP',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),
                        _textField(_emailcontroller, 'Email'),
                        if (!_isLogin) _textField(_namecontroller, 'Username'),
                        _textField(_passcontroller, 'Password'),
                        const SizedBox(height: 20),
                        // signIn text
                        Container(
                          height: 45,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [logGradient1Color, logGradient2Color],
                            ),
                          ),
                          child: TextButton(
                            onPressed: () =>
                                setState(() => _isLogin = !_isLogin),
                            child: Text(
                              _isLogin ? 'Sign In' : 'Sign Up',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Create new account',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white70),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(TextEditingController controller, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // password text
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white70),
        ),
        const SizedBox(height: 2),
        // password textfield
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [logGradient1Color, logGradient2Color],
            ),
          ),
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 13),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class AuthClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    final h = size.height, w = size.width;
    path.moveTo(8, 4);
    path.lineTo(w + 4, -4);
    path.lineTo(w - 8, h - 4);
    path.lineTo(-4, h + 4);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
