import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/routes/app_routes.dart';
import 'core/di/service_locator.dart'; // 🔹 Importamos el Service Locator
import 'presentation/state/matrix_provider.dart';

void main() {
  setupDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<MatrixProvider>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.getRoutes(),
    );
  }
}
