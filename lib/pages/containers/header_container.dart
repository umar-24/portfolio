// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

class _HeaderContainerState extends State<HeaderContainer>
    with SingleTickerProviderStateMixin {
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
    return Container(
      color: Colors.black,
      height: 700,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 30,
            ),
            //===================  container 1 =================
            Container(
              padding: EdgeInsets.all(16),
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Hey, It's ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Umar",
                        style: TextStyle(
                          color: skyBlueColor,
                          fontSize: 46,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "I'm ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 46,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        displayedText,
                        style: TextStyle(
                          color: skyBlueColor,
                          fontSize: 46,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Blinking cursor
                      AnimatedOpacity(
                        opacity: charIndex == titles[currentIndex].length
                            ? 0.0
                            : 1.0,
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          '|',
                          style: TextStyle(
                            color: skyBlueColor,
                            fontSize: 46,
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
                  const SizedBox(height: 30,),
                SocialMediaRow(),
                const SizedBox(height: 30,),
                DownloadButton(buttonText: "Download Resume", height: 50, width: 200, onPressed: (){}),
                
                ],
              ),
            ),
            //===================  container 2 =================
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              profilePic,
              height: 600,
            )
          ],
        ),
      ),
    );
  }
}
