import 'package:baby_buy/constants/routes.dart';
import 'package:baby_buy/widgets/elevated_button_widget.dart';
import 'package:baby_buy/widgets/read_and_privacy_policy_text_button_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final TextButton _read;
  late final TextButton _privacyPolicy;

  @override
  void initState() {
    _read = TextButton(
      onPressed: () {},
      child: const Text(
        'Read',
        style: TextStyle(
          fontFamily: 'SpaceGrotesk',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    _privacyPolicy = TextButton(
      onPressed: () {},
      child: const Text('Privacy Policy'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 65.0,
                  width: 65.0,
                  child: Image.asset('lib/image/motherandchild.jpg'),
                ),
                const Text(
                  'BabyBuy',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.w500,
                    color: Colors.white38,
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
                  fontSize: 20.0,
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 55.0,
            ),
            ElevatedButtonWidget(
              text: 'Create Account',
              textStyleColor: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed(createAccountRoute);
              },
              backgroundColor: const Color(0xFFCEE7EF),
              borderSideColor: const Color(0xFFCEE7EF),
            ),
            const SizedBox(
              height: 13.0,
            ),
            ElevatedButtonWidget(
              text: 'Login',
              textStyleColor: Colors.white,
              onPressed: () {},
              backgroundColor: Colors.black,
              borderSideColor: Colors.black,
            ),
            const SizedBox(
              height: 60.0,
            ),
            Text(
              'Read about our ${ReadAndPrivacyPolicyTextButtonWidget(function: () {}, text: 'Read')} and ${_privacyPolicy}',
              style: TextStyle(
                color: Colors.white60,
                fontFamily: 'SpaceGrotesk',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
