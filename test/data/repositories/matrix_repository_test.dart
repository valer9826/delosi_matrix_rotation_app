import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:delosi_matrix_rotation_app/domain/repositories/matrix_repository.dart';
import 'package:delosi_matrix_rotation_app/domain/entities/matrix.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MatrixRepository repository;

  setUp(() {
    repository = MockMatrixRepository();
  });

  group('MatrixRepositoryImpl - rotateMatrix', () {
    test('Given a matrix, when rotateMatrix is called, then it should return a rotated matrix', () async {
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
      final result = await repository.rotateMatrix(inputMatrix);

      // THEN
      expect(result.values, expectedRotatedMatrix.values);
      verify(repository.rotateMatrix(inputMatrix)).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
