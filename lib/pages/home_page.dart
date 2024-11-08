import 'package:flutter/material.dart';
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
      drawer: MyDrawer(),
      body: Column(
        children: [
          NavBar()
        ],
      ),
    );
  }
}