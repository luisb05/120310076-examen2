import 'package:examen2/src/pages/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de Países',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MenuScreen(),
    );
  }
}
