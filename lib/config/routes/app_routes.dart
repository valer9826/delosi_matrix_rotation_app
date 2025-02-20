import 'package:flutter/material.dart';
import '../../presentation/pages/matrix_screen.dart';
import '../../presentation/pages/test_a_screen.dart';
import '../../presentation/pages/test_b_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String testA = '/testA';
  static const String testB = '/testB';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => MatrixScreen(),
      testA: (context) => TestAScreen(),
      testB: (context) => TestBScreen(),
    };
  }
}
