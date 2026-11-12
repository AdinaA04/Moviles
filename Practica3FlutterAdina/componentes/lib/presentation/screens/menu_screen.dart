import 'package:componentes/models/menu_option.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    // Acceder a los parámetros del tema
    final colors = Theme.of(context).colorScheme;



    final menuOptions = <MenuOption>[
      MenuOption(ruta: "buttons", icono: Icons.radio_button_on_outlined, nombre: "Botones - Buttons"),
      MenuOption(ruta: "listview1", icono: Icons.list_alt, nombre: "ListView Tipo 1"),
      MenuOption(ruta: "listview2", icono: Icons.list, nombre: "ListView Tipo 2"),
      MenuOption(ruta: "alert", icono: Icons.add_alert, nombre: "Alertas - Alerts"),
      MenuOption(ruta: "card", icono: Icons.credit_card, nombre: "Tarjetas - Cards"),
      MenuOption(ruta: "slider", icono: Icons.slideshow, nombre: "Sliders & Checks"),
      MenuOption(ruta: "snackbar", icono: Icons.settings_accessibility_outlined, nombre: "Snackbar"),
      MenuOption(ruta: "animated", icono: Icons.animation, nombre: "Animated Screen"),
      MenuOption(ruta: "formulario", icono: Icons.forum_outlined, nombre: "Formulario Screen"),
      MenuOption(ruta: "practica8", icono: Icons.swipe, nombre: "Práctica 8"),
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes en Flutter'),
      ),
      body: ListView.separated(
        itemBuilder: (context, i ) => ListTile(
          leading: Icon(menuOptions[i].icono, color: colors.primary,),
          title: Text(menuOptions[i].nombre,),
          onTap: () {
            Navigator.pushNamed(context, menuOptions[i].ruta );
            /*final route = MaterialPageRoute(
              builder: (context) => ListView2Screen(),
            );
            Navigator.push(context, route);*/
          },
          trailing: Icon(Icons.arrow_forward_ios, color: colors.primary,),
        ), 
        separatorBuilder: (_, __) => Divider(), 
        itemCount: menuOptions.length
      )
    );
  }
}