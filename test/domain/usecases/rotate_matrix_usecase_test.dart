import 'package:delosi_matrix_rotation_app/domain/entities/matrix.dart';
import 'package:delosi_matrix_rotation_app/domain/usecases/rotate_matrix_usecase.dart';
import 'package:delosi_matrix_rotation_app/domain/usecases/rotate_matrix_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late RotateMatrixUseCase useCase;
  late MockMatrixRepository repository;

  setUp(() {
    repository = MockMatrixRepository();
    useCase = RotateMatrixUseCaseImpl(repository);
  });

  group('RotateMatrixUseCase - execute', () {
    test('Given a valid matrix, when execute is called, then it should return a rotated matrix', () async {
      // GIVEN
      final inputMatrix = Matrix([
        [1, 2],
        [3, 4]
      ]);

      final expectedRotatedMatrix = Matrix([
        [2, 4],
        [1, 3]
      ]);

      when(repository.rotateMatrix(inputMatrix)).thenAnswer((_) async => expectedRotatedMatrix);

      // WHEN
      final result = await useCase.execute(inputMatrix);

      // THEN
      expect(result.values, expectedRotatedMatrix.values);
      verify(repository.rotateMatrix(inputMatrix)).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
