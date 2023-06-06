import 'package:baby_buy/constants/routes.dart';
import 'package:baby_buy/services/auth/auth_service.dart';
import 'package:baby_buy/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
        child: ListView(
          children: [
            const Text(
              'Verify your Email',
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "We've sent you a mail. Please verify your email to get access.",
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButtonWidget(
              text: 'Send another email verification',
              textStyleColor: Colors.white,
              onPressed: () async {
                await AuthService.firebase().sendEmailVerification();
              },
              backgroundColor: const Color(0xFF00687B),
              borderSideColor: Colors.transparent,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButtonWidget(
              text: 'Go to Login',
              textStyleColor: const Color(0xFF00687B),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              backgroundColor: Colors.white,
              borderSideColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
