import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.size,
      required this.text,
      this.bgColor = Colors.black,
      this.fontColor = Colors.white,
      this.borderColor = Colors.black, this.ontap});

  final Size size;
  final String text;
  final Color bgColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            width: size.width * 0.9,
            height: 55,
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                color: bgColor,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: fontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
