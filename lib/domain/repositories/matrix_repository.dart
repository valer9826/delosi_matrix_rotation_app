import 'package:delosi_matrix_rotation_app/domain/entities/matrix.dart';

abstract class MatrixRepository {
  Future<Matrix> rotateMatrix(Matrix matrix);
}
