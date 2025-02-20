
class Matrix {
  final List<List<int>> values;

  Matrix(this.values);

  Matrix rotateAnticlockwise() {
    int n = values.length;
    List<List<int>> rotated = List.generate(n, (_) => List.filled(n, 0));

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        rotated[n - j - 1][i] = values[i][j];
      }
    }

    return Matrix(rotated);
  }
}
