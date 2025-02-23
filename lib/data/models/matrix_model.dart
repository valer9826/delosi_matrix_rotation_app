import 'package:delosi_matrix_rotation_app/domain/entities/matrix.dart';

class MatrixModel extends Matrix {
  MatrixModel(super.values);

  factory MatrixModel.fromJson(List<dynamic> json) {
    List<List<int>> values = json.map((row) => List<int>.from(row)).toList();
    return MatrixModel(values);
  }

  List<dynamic> toJson() => values.map((row) => row.toList()).toList();
}
