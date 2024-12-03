import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:examen2/src/const/api_constanst.dart';
import 'package:examen2/src/model/countrybycode.dart';

class ConsultaNombreScreen extends StatefulWidget {
  @override
  _ConsultaNombreScreenState createState() => _ConsultaNombreScreenState();
}

class _ConsultaNombreScreenState extends State<ConsultaNombreScreen> {
  final TextEditingController _controller = TextEditingController();
  Countrybycode? pais;  // Aquí usamos la clase Countrybycode

  // Método para consultar el país por nombre
  Future<void> _consultarPaisPorNombre(String nombre) async {
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.byNameEndpoint}/$nombre'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)[0]; // Tomamos el primer país en la lista
      setState(() {
        pais = Countrybycode.fromJson(data);
      });
    } else {
      setState(() {
        pais = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("País no encontrado"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consulta por Nombre de País")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Nombre del País"),
            ),
            ElevatedButton(
              onPressed: () {
                _consultarPaisPorNombre(_controller.text.trim());
              },
              child: Text("Consultar"),
            ),
            if (pais != null) ...[
              Text("Nombre Común: ${pais!.name.common}"),
              Text("Nombre Oficial: ${pais!.name.official}"),
              Text("Dominio TLD: ${pais!.tld.join(", ")}"),
              Text("CCA2: ${pais!.cca2}"),
              Text("CCA3: ${pais!.cca3}"),
            ]
          ],
        ),
      ),
    );
  }
}
