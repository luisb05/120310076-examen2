import 'package:flutter/material.dart';
import 'package:examen2/src/pages/consulta_nombre.dart';
import 'package:examen2/src/pages/consulta_codigo.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? _selectedOption = 'Consultar por Nombre';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consulta de Países")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
              },
              items: <String>['Consultar por Nombre', 'Consultar por Código']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedOption == 'Consultar por Nombre') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConsultaNombreScreen()),
                  );
                } else if (_selectedOption == 'Consultar por Código') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConsultaCodigoScreen()),
                  );
                }
              },
              child: const Text("Ir a Consulta"),
            ),
          ],
        ),
      ),
    );
  }
}
