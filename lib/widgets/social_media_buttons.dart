// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:portfolio/contants/images.dart';

class SocialMediaRow extends StatefulWidget {
  const SocialMediaRow({Key? key}) : super(key: key);

  @override
  _SocialMediaRowState createState() => _SocialMediaRowState();
}

class _SocialMediaRowState extends State<SocialMediaRow> {
  // List to track hover states for each button
  List<bool> _isHovered = [false, false, false, false];

  // Color definitions
  final Color skyBlueColor = Color(0xFF66b2ff);

  // Function to build each social media container with support for both icons and images
  Widget _buildSocialButton({
    IconData? icon,
    String? imagePath,
    required int index,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered[index] = true),
      onExit: (_) => setState(() => _isHovered[index] = false),
      child: InkWell(
        onTap: onTap, // Add onTap functionality
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 60,
          width: 60,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: _isHovered[index] ? skyBlueColor : Colors.blue,
              width: 2,
            ),
            shape: BoxShape.circle,
            color: Colors.transparent,
            boxShadow: _isHovered[index]
                ? [
                    BoxShadow(
                      color: skyBlueColor.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ]
                : [],
          ),
          child: Center(
            child: imagePath != null
                ? Image.asset(
                    imagePath,
                    height: 30,
                    width: 30,
                    color: _isHovered[index] ? Colors.white : skyBlueColor, // Optional tint on hover
                  )
                : Icon(
                    icon,
                    color: _isHovered[index] ? Colors.white : skyBlueColor,
                    size: 30,
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSocialButton(
          imagePath: github,
          index: 0,
          onTap: () {
            // Action for GitHub icon
            print('GitHub icon tapped');
          },
        ),
        _buildSocialButton(
          imagePath: linkedin, // Example image
          index: 1,
          onTap: () {
            // Action for LinkedIn icon
            print('LinkedIn icon tapped');
          },
        ),
        _buildSocialButton(
          imagePath: instagram,
          index: 2,
          onTap: () {
            // Action for Instagram icon
            print('Instagram icon tapped');
          },
        ),
        _buildSocialButton(
          icon: Icons.facebook, // Example image
          index: 3,
          onTap: () {
            // Action for Facebook icon
            print('Facebook icon tapped');
          },
        ),
      ],
    );
  }
}
