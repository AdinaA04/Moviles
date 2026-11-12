import 'package:flutter/material.dart';

// Práctica 8: Widget Dismissible (Widget of the Week)
class Practica8Screen extends StatefulWidget {
  const Practica8Screen({super.key});

  @override
  State<Practica8Screen> createState() => _Practica8ScreenState();
}

// Clase que guarda el estado de la pantalla (la lista de tareas)
class _Practica8ScreenState extends State<Practica8Screen> {
  // Lista de 10 tareas: "Tarea 1", "Tarea 2"... "Tarea 10"
  final List<String> tareas = List.generate(10, (i) => 'Tarea ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Práctica 8')),

      // Si ya no quedan tareas muestra un mensaje; si no, la lista
      body: tareas.isEmpty
          ? const Center(child: Text('No quedan tareas'))
          : ListView.builder(
              itemCount: tareas.length,
              itemBuilder: (context, index) {
                final tarea = tareas[index];

                // Dismissible: permite deslizar un elemento para descartarlo
                return Dismissible(
                  // Identificador único de cada elemento (obligatorio)
                  key: ValueKey(tarea),

                  // Fondo al deslizar hacia la DERECHA (completar)
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),

                  // Fondo al deslizar hacia la IZQUIERDA (eliminar)
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),

                  // Se ejecuta antes de descartar. Si devuelve true se
                  // descarta; si devuelve false, vuelve a su sitio
                  confirmDismiss: (direction) async {
                    // Solo pide confirmación al deslizar hacia la izquierda
                    if (direction == DismissDirection.endToStart) {
                      return await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('¿Eliminar?'),
                          content: Text('Se eliminará "$tarea".'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx, false),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(ctx, true),
                              child: const Text('Eliminar'),
                            ),
                          ],
                        ),
                      );
                    }
                    return true;
                  },

                  // Se ejecuta cuando el elemento ya se ha descartado
                  onDismissed: (direction) {
                    // Hay que quitarlo de la lista, si no Flutter da error
                    setState(() => tareas.removeAt(index));

                    final accion = direction == DismissDirection.startToEnd
                        ? 'completada'
                        : 'eliminada';

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$tarea $accion')),
                    );
                  },

                  // Elemento visible de la lista (lo que se desliza)
                  child: ListTile(
                    leading: const Icon(Icons.task_alt),
                    title: Text(tarea),
                    subtitle: const Text('Desliza para completar o eliminar'),
                  ),
                );
              },
            ),
    );
  }
}
