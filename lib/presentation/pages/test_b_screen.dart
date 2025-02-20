import 'package:flutter/material.dart';

class TestBScreen extends StatelessWidget {
  const TestBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla B")),
      body: Center(child: Text("Test B Screen")),
    );
  }
}
