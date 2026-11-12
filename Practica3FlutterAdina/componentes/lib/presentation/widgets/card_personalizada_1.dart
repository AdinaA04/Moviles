import 'package:flutter/material.dart';

class CardTipo1 extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 0,
      child: Column(
        children: [
          ListTile(
            leading: Icon( Icons.photo_album_outlined ),
            title: Text('Soy un título'),
            subtitle: Text('Velit sunt qui adipisicing exercitation cillum cupidatat non id sunt dolore qui.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: .end,
              children: [
                TextButton(onPressed: (){}, child: Text('Cancelar')),
                TextButton(onPressed: (){}, child: Text('Ok')),
              ],
            ),
          )
        ],
      ),
    );
  }
}