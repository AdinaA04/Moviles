import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
   
  const SnackbarScreen({super.key});

  void mostrarSnackbarPersonalizado(BuildContext context){

    // Eliminamos el snackbar para evitar repeticiones absurdas
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text('Hola a DAM2'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {},),
      duration: Duration(seconds: 2),
      backgroundColor: CupertinoColors.activeBlue,
    ); 

    // Mostramos el Snackbar que nos hemos creado
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Text('SnackbarScreen'),
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => mostrarSnackbarPersonalizado(context),
        label: Text('Mostrar Snackbar')
      ),  
    );
  }
}