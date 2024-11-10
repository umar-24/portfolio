// ignore_for_file: prefer_const_constructors, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/nav_buttons.dart';
import 'package:portfolio/widgets/outline_button.dart';

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
                      NavButtons(text: "Portfolio", index: 0, onTap: (index){
                        setState(() {
                          activeIndex = index;
                        });
                      }, activeIndex: activeIndex),
                      const SizedBox(width: 20),
                      NavButtons(text: "About", index: 1, onTap: (index){
                        setState(() {
                          activeIndex = index;
                        });
                      }, activeIndex: activeIndex),
                      const SizedBox(width: 20),
                     NavButtons(text: "Skills", index: 2, onTap: (index){
                        setState(() {
                          activeIndex = index;
                        });
                      }, activeIndex: activeIndex),
                      const SizedBox(width: 20),
                     NavButtons(text: "Projects", index: 3, onTap: (index){
                        setState(() {
                          activeIndex = index;
                        });
                      }, activeIndex: activeIndex),
                      const SizedBox(width: 20),
                     OutlineButtonWidget(onPressed: (){}, text: "Contact Me"),
                    ],
                  )
                : IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}


