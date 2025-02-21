import '../entities/matrix.dart';

abstract class RotateMatrixUseCase {
  Future<Matrix> execute(Matrix matrix);
}
