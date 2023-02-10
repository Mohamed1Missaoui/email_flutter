import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen();
  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  MenuScreenState();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
            floatingActionButton: null,
            body: Text("Homme"),
          
    );
  }
}
