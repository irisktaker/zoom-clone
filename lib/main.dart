import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';

import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/firebase_options.dart';
import 'package:zoom_clone/views/screens/auth/login_screen.dart';
import 'package:zoom_clone/views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
        //. we need this to keep the user sign_in
        stream: AuthController().authChanges,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
