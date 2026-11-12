import 'package:flutter/material.dart';

// Mapa que asigna a cada número de pantalla un color distinto
const Map<int, Color> colores = {
  1: Colors.purple,
  2: Colors.green,
  3: Colors.orange,
  4: Colors.pink,
  5: Colors.red,
};

// Mapa que indica a qué pantallas se puede ir desde cada pantalla
const Map<int, List<int>> destinos = {
  1: [3, 4],    // Desde la 1 se va a la 3 y a la 4
  2: [5],       // Desde la 2 se va a la 5
  3: [1, 2],    // Desde la 3 se va a la 1 y a la 2
  4: [3, 5],    // Desde la 4 se va a la 3 y a la 5
  5: [1, 2, 4], // Desde la 5 se va a la 1, 2 y 4
};

// Widget único que sirve para las 5 pantallas
class PantallaScreen extends StatelessWidget {
  final int numero;

  const PantallaScreen({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    final color = colores[numero]!;

    // Estilo común de los botones de esta pantalla
    final estiloBoton = ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla $numero'),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Un botón por cada pantalla a la que se puede ir desde esta
            for (final destino in destinos[numero]!)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: estiloBoton,
                  onPressed: () => Navigator.pushNamed(context, 'pantalla$destino'),
                  child: Text('Ir a la pantalla $destino'),
                ),
              ),

            // Botón extra solo en la pantalla 5: elimina toda la pila y vuelve a la pantalla inicial
            if (numero == 5)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: estiloBoton,
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    'pantalla1',
                    (route) => false,
                  ),
                  child: const Text('Volver al inicio (vaciar pila)'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
