import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTapFunc,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final GestureTapCallback? onTapFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(text,
            style: const TextStyle(
              color: Colors.white,
              //fontWeight: FontWeight.bold,
            )),
        onTap: onTapFunc,
        hoverColor: const Color(0x11FFFFFF),
      ),
    );
  }
}
