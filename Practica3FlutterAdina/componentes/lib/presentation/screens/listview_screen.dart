import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {

  final games = ["Sonic","Rocket Night Adventures", "Cool Spot", "Micromachines", "Street Fighter II","Street of Rage 2"];
   
  ListView1Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview Tipo 1'),),
      body: ListView(
        children: [

          ...games.map( ( juego ) => ListTile(
              leading: Icon( Icons.access_time_sharp),
              title: Text( juego ),
              subtitle: Text('Sega Mega Drive'),
              onTap: () {
                
              },
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Divider()

        ],
      )
    );
  }
}