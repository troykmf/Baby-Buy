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
      body: ListView(
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
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 3.0,
                side: const BorderSide(color: Color(0xFFCEE7EF))),
            child: const Text(
              'Create Account',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SpaceGrotesk',
              ),
            ),
          ),
          const SizedBox(
            height: 13.0,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 3.0,
              side: const BorderSide(
                color: Color(0xFF00687B),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SpaceGrotesk',
              ),
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Text('Read about our $_read and $_privacyPolicy'),
        ],
      ),
    );
  }
}
