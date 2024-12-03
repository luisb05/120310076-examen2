import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:examen2/src/const/api_constanst.dart';
import 'package:examen2/src/model/country.dart';

class ConsultaNombreScreen extends StatefulWidget {
  const ConsultaNombreScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConsultaNombreScreenState createState() => _ConsultaNombreScreenState();
}

class _ConsultaNombreScreenState extends State<ConsultaNombreScreen> {
  final TextEditingController _controller = TextEditingController();
  Countrybycode? pais;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consulta por Nombre de País")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Nombre del País"),
            ),
            ElevatedButton(
              onPressed: () {
                _consultarPaisPorNombre(_controller.text.trim());
              },
              child: const Text("Consultar"),
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

  Future<void> _consultarPaisPorNombre(String nombre) async {
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.byNameEndpoint}/$nombre'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)[0];
      setState(() {
        pais = Countrybycode.fromJson(data);
      });
    } else {
      setState(() {
        pais = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("País no encontrado"),
      ));
    }
  }

}
