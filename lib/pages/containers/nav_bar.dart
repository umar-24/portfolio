// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int activeIndex = 0; // State to keep track of active button index

  @override
  Widget build(BuildContext context) {
    // Retrieve screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Image.asset("assets/images/logo.png", height: 90),
            // Nav Buttons
            screenWidth > 600 // Show full nav items on wider screens
                ? Row(
                    children: [
                      _buildNavButton("Home", 0),
                      const SizedBox(width: 20),
                      _buildNavButton("Services", 1),
                      const SizedBox(width: 20),
                      _buildNavButton("Work", 2),
                      const SizedBox(width: 20),
                      _buildNavButton("About", 3),
                      const SizedBox(width: 20),
                      _buildNavButton("Blog", 4),
                      const SizedBox(width: 20),
                      _outlineButton(() {}, "Contact"),
                    ],
                  )
                : IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: activeIndex == index ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 2,
            width: activeIndex == index ? 30 : 0,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: activeIndex == index ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _outlineButton(void Function()? onPressed, String text) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.blue), // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Border radius
        ),
      ),
    );
  }
}
