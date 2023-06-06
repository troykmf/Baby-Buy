import 'package:baby_buy/screens/create_account_screen.dart';
import 'package:baby_buy/screens/login_screen.dart';
import 'package:baby_buy/screens/main_screen.dart';
import 'package:baby_buy/screens/welcome_screen.dart';
import 'package:baby_buy/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Baby Buy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF00687B),
          // Color(0xFFCEE7EF), for the textfields
          //   Color(0xFF00687B), for the buttons
        ),
        home: const CreateAccountScreen(),
        routes: {
          loginRoute: (context) => const LoginScreen(),
          createAccountRoute: (context) => const CreateAccountScreen(),
          welcomeRoute: (context) => const WelcomeScreen(),
          mainRoute: (context) => const MainScreen(),
        });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const MainScreen();
              } else {
                return Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Center(
                    child: Text('Please verify your email'),
                  ),
                );
              }
            } else {
              return const LoginScreen();
            }

          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
