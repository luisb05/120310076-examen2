import 'package:examen2/src/menu/menu.dart';
import 'package:examen2/src/pages/consulta_codigo.dart';
import 'package:examen2/src/pages/consulta_nombre.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => MenuScreen(),
    'Consultar por Nombre': (BuildContext context) => const ConsultaNombreScreen(),
    'Consultar por Código': (BuildContext context) => const ConsultaCodigoScreen(),
  };
}