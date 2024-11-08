// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/pages/containers/header_container.dart';
import 'package:portfolio/pages/containers/nav_bar.dart';
import 'package:portfolio/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            HeaderContainer()
          ],
        ),
      ),
    );
  }
}