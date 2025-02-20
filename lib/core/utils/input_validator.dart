class InputValidator {
  static String? validateMatrixInput(String input) {
    if (input.isEmpty) {
      return "El input no puede estar vacío";
    }

    List<String> rows = input.split(';');
    int? expectedLength;

    for (String row in rows) {
      List<String> elements = row.split(',');

      if (expectedLength == null) {
        expectedLength = elements.length;
      } else if (elements.length != expectedLength) {
        return "Todas las filas deben tener el mismo número de elementos";
      }

      if (elements.any((e) => int.tryParse(e.trim()) == null)) {
        return "Solo se permiten números en la matriz";
      }
    }

    return null;
  }
}
