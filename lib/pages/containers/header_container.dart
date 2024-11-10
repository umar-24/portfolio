// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:portfolio/contants/colors.dart';
import 'package:portfolio/contants/images.dart';
import 'package:portfolio/widgets/download_button.dart';
import 'package:portfolio/widgets/social_media_buttons.dart';

class HeaderContainer extends StatefulWidget {
  const HeaderContainer({super.key});

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> with SingleTickerProviderStateMixin {
  
  final List<String> titles = [
    "Flutter App Developer.",
    "Mobile App Developer."
  ];
  int currentIndex = 0;
  String displayedText = '';
  bool isDeleting = false;
  int charIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (!isDeleting) {
          // Typing characters
          if (charIndex < titles[currentIndex].length) {
            displayedText += titles[currentIndex][charIndex];
            charIndex++;
          } else {
            // Pause before deleting
            Future.delayed(Duration(seconds: 1), () {
              isDeleting = true;
            });
          }
        } else {
          // Deleting characters
          if (charIndex > 0) {
            displayedText = displayedText.substring(0, charIndex - 1);
            charIndex--;
          } else {
            // Switch to next text after deletion
            isDeleting = false;
            currentIndex = (currentIndex + 1) % titles.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if the screen size is considered "mobile" or "desktop"
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        );
      },
    );
  }

  // Mobile layout
  Widget _buildMobileLayout() {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          height: 300,
          child: Image.asset(
            profilePic,
            height: 300,
            fit: BoxFit.contain,
          ),
        ),
        _buildTextContent(),
      ],
    );
  }

  // Desktop layout
  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 30),
        Expanded(
          flex: 2,
          child: _buildTextContent(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 600,
            child: Image.asset(
              profilePic,
              height: 600,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  // Text content
  Widget _buildTextContent() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
  children: [
    MediaQuery.of(context).size.width < 600
        ? Text(
            "Hey, It's ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20, // Smaller font for mobile
              fontWeight: FontWeight.bold,
            ),
          )
        : Text(
            "Hey, It's ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 46, // Larger font for desktop
              fontWeight: FontWeight.bold,
            ),
          ),
    MediaQuery.of(context).size.width < 600
        ? Text(
            "Umar",
            style: TextStyle(
              color: skyBlueColor,
              fontSize: 20, // Smaller font for mobile
              fontWeight: FontWeight.bold,
            ),
          )
        : Text(
            "Umar",
            style: TextStyle(
              color: skyBlueColor,
              fontSize: 46, // Larger font for desktop
              fontWeight: FontWeight.bold,
            ),
          ),
  ],
),

SizedBox(height: 5),

Row(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    MediaQuery.of(context).size.width < 600
        ? Text(
            "I'm ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20, // Smaller font for mobile
              fontWeight: FontWeight.bold,
            ),
          )
        : Text(
            "I'm ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 46, // Larger font for desktop
              fontWeight: FontWeight.bold,
            ),
          ),
    MediaQuery.of(context).size.width < 600
        ? Text(
            displayedText,
            style: TextStyle(
              color: skyBlueColor,
              fontSize: 20, // Smaller font for mobile
              fontWeight: FontWeight.bold,
            ),
          )
        : Text(
            displayedText,
            style: TextStyle(
              color: skyBlueColor,
              fontSize: 46, // Larger font for desktop
              fontWeight: FontWeight.bold,
            ),
          ),
    // Blinking cursor
    AnimatedOpacity(
      opacity: charIndex == titles[currentIndex].length ? 0.0 : 1.0,
      duration: Duration(milliseconds: 500),
      child: MediaQuery.of(context).size.width < 600
          ? Text(
              '|',
              style: TextStyle(
                color: skyBlueColor,
                fontSize: 20, // Smaller font for mobile
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(
              '|',
              style: TextStyle(
                color: skyBlueColor,
                fontSize: 46, // Larger font for desktop
                fontWeight: FontWeight.bold,
              ),
            ),
    ),
  ],
),

          Text(
            "I am a Flutter mobile app developer with 2 years of experience creating high-performing cross-platform \napplicationsfor Android and iOS.My expertise includes intuitive UI design, backend integration, \nand scalable code.I am passionate about building innovative, user-focused mobile solutions.",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 30),
          SocialMediaRow(),
          const SizedBox(height: 30),
          DownloadButton(buttonText: "Download Resume", height: 50, width: 200, onPressed: () {}),
        ],
      ),
    );
  }
}
