import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const OutlineButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.blue), // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Border radius
        ),
      ),
    );
  }
}
