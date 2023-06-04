import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.text,
    required this.textStyleColor,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderSideColor,
  }) : super(key: key);

  final String text;
  final Color textStyleColor;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderSideColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15.0,
          color: textStyleColor,
          fontFamily: 'SpaceGrotesk',
        ),
      ),
    );
  }
}
