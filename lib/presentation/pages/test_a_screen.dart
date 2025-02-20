import 'package:flutter/material.dart';

class TestAScreen extends StatelessWidget {
  const TestAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla A")),
      body: Center(child: Text("Test A Screen")),
    );
  }
}
