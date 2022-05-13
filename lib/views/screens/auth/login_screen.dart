import 'package:flutter/material.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/views/screens/home_screen.dart';
import 'package:zoom_clone/views/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = AuthController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start or join a meeting",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Image.asset(
              "assets/images/onboarding.jpg",
            ),
          ),
          CustomButton(
            text: 'Login',
            onPressed: () {
              //..
              // AuthController().signInWithGoogle();
              _authController.signInWithGoogle();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
