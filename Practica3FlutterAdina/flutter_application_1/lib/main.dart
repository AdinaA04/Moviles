import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegación en Flutter',
      // La aplicación se inicia en la pantalla 1
      initialRoute: 'pantalla1',
      // Una ruta con nombre por cada pantalla: pantalla1 ... pantalla5
      routes: {
        for (final n in destinos.keys)
          'pantalla$n': (context) => PantallaScreen(numero: n),
      },
      // Si la ruta no existe, se vuelve a la pantalla 1
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => const PantallaScreen(numero: 1),
      ),
    );
  }
}
