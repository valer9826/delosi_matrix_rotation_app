import 'package:delosi_matrix_rotation_app/domain/entities/matrix.dart';
import '../repositories/matrix_repository.dart';

class RotateMatrixUseCase {
  final MatrixRepository repository;

  RotateMatrixUseCase(this.repository);

  Future<Matrix> execute(Matrix matrix) {
    return repository.rotateMatrix(matrix);
  }
}
