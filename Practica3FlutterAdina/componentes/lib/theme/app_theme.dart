import 'package:flutter/material.dart';

const listaColores = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {

  final int colorSeleccionado;

  new({
    this.colorSeleccionado = 0
  }): assert( colorSeleccionado >= 0, 'El color seleccionado debe se mayor de 0'),
      assert( colorSeleccionado < listaColores.length, 'El color seleccionado debe ser igual o menor que ${ listaColores.length - 1 }');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: listaColores[ colorSeleccionado ],
    // AppbarTheme
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
    // InputDecorationTheme
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: listaColores[colorSeleccionado]),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: listaColores[colorSeleccionado]),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: listaColores[colorSeleccionado]),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
    ),
    border: OutlineInputBorder(
      borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
    )
  ));

  

  // Color primario
  static const Color primary = Colors.orange;
  static const Color secondary = Colors.yellow;

  // Tema Light
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //Color primario
      primaryColor: primary,
      useMaterial3: false,
      // AppBar
      appBarTheme: AppBarTheme(
          backgroundColor: primary,
          elevation: 0,
        )
  );




  // Tema Halloween
  static final ThemeData halloweenTheme = ThemeData.dark().copyWith(
    //Color primario
    primaryColor: Colors.orangeAccent,
    primaryColorDark: Colors.orangeAccent,
    

    //scaffoldBackgroundColor: Colors.blueGrey
  );

  
}