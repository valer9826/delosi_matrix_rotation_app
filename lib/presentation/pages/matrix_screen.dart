import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/matrix_provider.dart';
import '../../config/routes/app_routes.dart';

class MatrixScreen extends StatefulWidget {
  const MatrixScreen({super.key});

  @override
  MatrixScreenState createState() => MatrixScreenState();
}

class MatrixScreenState extends State<MatrixScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MatrixProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text("Rotar Matriz")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Ingrese la matriz NxN (Ej: 1,2;3,4)",
                    border: OutlineInputBorder(),
                    errorText: _errorMessage,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      _errorMessage = null;
                    });
                  },
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    List<List<int>>? matrix = parseInput(_controller.text);
                    if (matrix == null) {
                      setState(() {
                        _errorMessage = "Ingrese un input válido (Ej: 1,2;3,4)";
                      });
                      return;
                    }
                    setState(() => _errorMessage = null);
                    provider.setInputMatrix(matrix);
                    provider.rotate();
                  },
                  child: Text("Rotar Matriz"),
                ),
                SizedBox(height: 20),

                //matriz original
                if (provider.inputMatrix != null)
                  buildMatrix("Matriz Original", provider.inputMatrix!.values),

                //matriz rotada
                if (provider.matrix != null)
                  buildMatrix("Matriz Rotada", provider.matrix!.values),

                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.testA),
                      child: Text("Ir a Test A"),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.testB),
                      child: Text("Ir a Test B"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<List<int>>? parseInput(String input) {
    try {
      List<String> rows = input.split(';');
      int? expectedLength;
      List<List<int>?> parsedMatrix = rows.map((row) {
        List<String> elements = row.split(',');
        if (expectedLength == null) {
          expectedLength = elements.length;
        } else if (elements.length != expectedLength) {
          return null;
        }
        return elements.map((e) => int.tryParse(e.trim()) ?? -9999).toList();
      }).toList();
      if (parsedMatrix.any((row) => row == null || row.contains(-9999))) {
        return null;
      }
      return parsedMatrix.cast<List<int>>();
    } catch (e) {
      return null;
    }
  }

  Widget buildMatrix(String title, List<List<int>> matrix) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: matrix[0].length,
            childAspectRatio: 1.0,
          ),
          itemCount: matrix.length * matrix[0].length,
          itemBuilder: (context, index) {
            int row = index ~/ matrix[0].length;
            int col = index % matrix[0].length;
            return Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: Text(
                matrix[row][col].toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ],
    );
  }
}
