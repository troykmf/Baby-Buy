import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  child: Image.asset(''),
                ),
                const Text(
                  'BabyBuy',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'SpaceGrotesk',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Expanded(
              child: Text(
                'Create a comprehensive list of items your baby will need on-the-go',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'SpaceGrotesk',
                ),
              ),
            ),
            const SizedBox(
              height: 55.0,
            ),
          ],
        ),
      ),
    );
  }
}
