import 'package:flutter/material.dart';

class DrawerListTileWidget extends StatelessWidget {
  const DrawerListTileWidget({
    Key? key,
    required this.title,
    required this.leading,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final IconData leading;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: const TextStyle(
        fontFamily: 'SpaceGrotesk',
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      horizontalTitleGap: -0.5,
      onTap: onTap,
      leading: Icon(
        leading,
        size: 20.0,
        color: Colors.white,
      ),
      title: Text(
        title,
      ),
    );
  }
}
