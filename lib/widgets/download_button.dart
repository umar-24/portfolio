// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:portfolio/contants/colors.dart';

class DownloadButton extends StatelessWidget {
  final String buttonText;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const DownloadButton({
    Key? key,
    required this.buttonText,
    required this.height,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: skyBlueColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white, // Text color
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
