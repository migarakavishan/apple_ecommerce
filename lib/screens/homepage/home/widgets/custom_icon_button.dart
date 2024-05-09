import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.text,
      required this.icon,
      this.color = Colors.blue,
      this.bgColor = Colors.blue, this.onTap});

  final String text;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
