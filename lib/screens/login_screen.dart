import 'package:baby_buy/constants/routes.dart';
import 'package:baby_buy/screens/main_screen.dart';
import 'package:baby_buy/utilities/dialogs/error_dialog.dart';
import 'package:baby_buy/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:baby_buy/services/auth/auth_exceptions.dart';
import '../services/auth/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email;

  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 30.0, right: 16.0),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'SpaceGrotesk',
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Expanded(
              child: Text(
                'Welcome back, provide your login details to login to your account',
                style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Email Address',
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 50.0,
              child: Center(
                child: TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFCEE7EF),
                      hintText: 'e.g name@example.com',
                      hintStyle: const TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Password',
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 50.0,
              child: Center(
                child: TextField(
                  obscureText: true,
                  controller: _password,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFCEE7EF),
                      hintText: '**********',
                      hintStyle: const TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF00687B),
                      fontFamily: 'SpaceGrotesk',
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButtonWidget(
              text: 'Login',
              textStyleColor: Colors.white,
              onPressed: () async {
                final email = _email.text.trim();
                final password = _password.text.trim();
                try {
                  await AuthService.firebase().logIn(
                    email: email,
                    password: password,
                  );
                  final user = AuthService.firebase().currentUser;
                  if (user?.isEmailVerified ?? false) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      mainRoute,
                      (route) => false,
                    );
                  } else {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      verifyRoute,
                      (route) => false,
                    );
                  }
                } on UserNotFoundAuthException {
                  await showErrorDialog(
                    context,
                    'User not found',
                  );
                } on WrongPasswordAuthException {
                  await showErrorDialog(
                    context,
                    'Wrong credentials',
                  );
                } on GenericAuthException {
                  await showErrorDialog(
                    context,
                    'Authentication error',
                  );
                }
              },
              backgroundColor: const Color(0xFF00687B),
              borderSideColor: Colors.transparent,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Center(
              child: Text(
                'OR',
                style: TextStyle(
                  color: Color(0xFF00687B),
                  fontFamily: 'SpaceGrotesk',
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButtonWidget(
              text: 'Sign Up',
              textStyleColor: const Color(0xFF00687B),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  createAccountRoute,
                  (route) => false,
                );
              },
              backgroundColor: Colors.white,
              borderSideColor: const Color(0xFF00687B),
            ),
          ],
        ),
      ),
    );
  }
}
