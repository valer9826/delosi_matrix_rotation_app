import 'package:delosi_matrix_rotation_app/domain/entities/matrix.dart';
import '../../domain/repositories/matrix_repository.dart';

class MatrixRepositoryImpl implements MatrixRepository {
  @override
  Future<Matrix> rotateMatrix(Matrix matrix) async {
    return Future.value(matrix.rotateAnticlockwise());
  }
}
