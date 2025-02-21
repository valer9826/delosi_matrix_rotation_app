import '../../domain/repositories/matrix_repository.dart';
import '../../domain/usecases/rotate_matrix_usecase.dart';
import '../../domain/entities/matrix.dart';

class RotateMatrixUseCaseImpl implements RotateMatrixUseCase {
  final MatrixRepository repository;

  RotateMatrixUseCaseImpl(this.repository);

  @override
  Future<Matrix> execute(Matrix matrix) {
    return repository.rotateMatrix(matrix);
  }
}
