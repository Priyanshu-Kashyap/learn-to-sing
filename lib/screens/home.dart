import 'package:flutter/material.dart';
import 'package:learn_to_sing/widgets/navbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: NavBar(),
      ),
    );
  }
}
