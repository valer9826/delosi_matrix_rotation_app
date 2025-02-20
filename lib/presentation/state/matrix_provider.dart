import 'package:flutter/material.dart';
import 'package:delosi_matrix_rotation_app/domain/entities/matrix.dart';
import '../../domain/usecases/rotate_matrix_usecase.dart';
import '../../core/utils/native_toast.dart';

class MatrixProvider extends ChangeNotifier {
  final RotateMatrixUseCase rotateMatrixUseCase;
  Matrix? _matrix;
  Matrix? _originalMatrix;
  Matrix? _inputMatrix;

  MatrixProvider(this.rotateMatrixUseCase);

  Matrix? get matrix => _matrix;
  Matrix? get originalMatrix => _originalMatrix;
  Matrix? get inputMatrix => _inputMatrix;

  void setInputMatrix(List<List<int>> input) {
    _inputMatrix = Matrix(input);
    notifyListeners();
  }

  void rotate() async {
    if (_inputMatrix == null) return;

    _originalMatrix = _inputMatrix;
    Matrix? newMatrix = await rotateMatrixUseCase.execute(_inputMatrix!);

    _matrix = newMatrix;
    notifyListeners();

    NativeToast.showToast("Matriz Original: ${_originalMatrix!.values}");
  }
}
