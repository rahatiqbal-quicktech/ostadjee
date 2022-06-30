import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          color: Colors.red,
          height: 200,
          width: 200,
        ),
      )),
    );
  }
}
