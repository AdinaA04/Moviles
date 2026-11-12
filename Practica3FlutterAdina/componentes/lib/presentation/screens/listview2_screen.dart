import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {

  final games = ["Sonic","Rocket Night Adventures", "Cool Spot", "Micromachines", "Street Fighter II","Street of Rage 2", "Fifa 94", "Italia 90"];
   
  ListView2Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview Tipo 2'),),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
              leading: Icon( Icons.access_time_sharp),
              title: Text( games[index] ),
              subtitle: Text('Sega Mega Drive'),
              onTap: () {
                
              },
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
        separatorBuilder: (_, __ ) => Divider(), 
        itemCount: games.length
      )
    );
  }
}