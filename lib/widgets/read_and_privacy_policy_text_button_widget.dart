import 'package:flutter/material.dart';

class ReadAndPrivacyPolicyTextButtonWidget extends StatelessWidget {
  const ReadAndPrivacyPolicyTextButtonWidget({
    Key? key,
    required this.function,
    required this.text,
  }) : super(key: key);

  final VoidCallback function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(text),
    );
  }
}
