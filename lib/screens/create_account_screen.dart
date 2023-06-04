import 'package:baby_buy/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late final TextEditingController _displayName;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _displayName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _displayName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0),
      child: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Account',
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
              'Kindly provide the few details below and we will setup your account',
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Choose Display Name',
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),
          SizedBox(
            height: 50.0,
            child: Center(
              child: TextField(
                controller: _displayName,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFCEE7EF),
                  hintText: 'e.g Bello Toluloppe',
                  hintStyle: const TextStyle(
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Enter Email',
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),
          SizedBox(
            height: 50.0,
            child: Center(
              child: TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
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
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Password',
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),
          SizedBox(
            height: 50.0,
            child: Center(
              child: TextField(
                controller: _password,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFCEE7EF),
                  hintText: '***********',
                  hintStyle: const TextStyle(
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Expanded(
            child: Text(
              'Password must be at least 8 characters and have at least a:\n   Uppercase letter e.g A\n   Special charater e.g @\n   Number e.g 1',
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
                fontSize: 14.0,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          ElevatedButtonWidget(
            text: 'Create Account',
            textStyleColor: Colors.white,
            onPressed: () {},
            backgroundColor: const Color(0xFF00687B),
            borderSideColor: const Color(0xFF00687B),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OR',
                style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButtonWidget(
            text: 'Login',
            textStyleColor: const Color(0xFF00687B),
            onPressed: () {},
            backgroundColor: Colors.white,
            borderSideColor: const Color(0xFF00687B),
          ),
        ],
      ),
    ));
  }
}
