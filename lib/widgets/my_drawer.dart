// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/nav_buttons.dart';
import 'package:portfolio/widgets/outline_button.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
    int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
           NavButtons(text: "Portfolio", index: 0, onTap: (index){
                        setState(() {
                          activeIndex = index;
                        });
                      }, activeIndex: activeIndex),
                      const SizedBox(height: 20),
                      NavButtons(text: "About", index: 1, onTap: (index){
                        setState(() {
                          activeIndex = index;
                        });
                      }, activeIndex: activeIndex),
                      const SizedBox(height: 20),
                     NavButtons(text: "Skills", index: 2, onTap: (index){
                        setState(() {
                          activeIndex = index;
                        });
                      }, activeIndex: activeIndex),
                      const SizedBox(height: 20),
                     NavButtons(text: "Projects", index: 3, onTap: (index){
                        setState(() {
                          activeIndex = index;
                        });
                      }, activeIndex: activeIndex),
                      const SizedBox(height: 20),
                     OutlineButtonWidget(onPressed: (){}, text: "Contact Us"),
        ],
      ),
    );
  }
}