import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:delosi_matrix_rotation_app/presentation/pages/matrix_screen.dart';
import 'package:delosi_matrix_rotation_app/presentation/state/matrix_provider.dart';
import 'package:delosi_matrix_rotation_app/domain/usecases/rotate_matrix_usecase.dart';
import 'package:mockito/mockito.dart';

// 🔹 Mock del UseCase necesario para MatrixProvider
class MockRotateMatrixUseCase extends Mock implements RotateMatrixUseCase {}

void main() {
  testWidgets('MatrixScreen renders correctly', (WidgetTester tester) async {
    final mockUseCase = MockRotateMatrixUseCase();

    //PumpWidget con MultiProvider
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MatrixProvider(mockUseCase),
          ),
        ],
        child: MaterialApp(home: MatrixScreen()),
      ),
    );

    //Verifica que la pantalla contiene exactamente un botón "Rotar Matriz"
    expect(find.widgetWithText(ElevatedButton, 'Rotar Matriz'), findsOneWidget);
  });
}
