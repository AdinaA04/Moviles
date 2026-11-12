import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _valorSlider = 60;
  bool _sliderActivado = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders & Checks'),),
      body: Column(
        children: [
          Slider.adaptive(
            min: 30,
            max: 400,
            value: _valorSlider, 
            onChanged: _sliderActivado 
            ? (value) {
              setState(() {
                  _valorSlider = value;
              });
            }
            : null
          ),

          /*Checkbox.adaptive(
            value: _sliderActivado, 
            onChanged: (value){
              _sliderActivado = value ?? true;
              setState(() {});
            },
          ),

          Switch.adaptive(value: _sliderActivado, onChanged: (value){
              _sliderActivado = value;
              setState(() {});
          },)
          */

        /*  CheckboxListTile.adaptive(
            title: Text('Habilitar slider'),
          /*  secondary: Icon(Icons.access_alarm), */
          /*  subtitle: Text('Esto es un subtitulo'), */
            value: _sliderActivado, 
            onChanged: (value){
              _sliderActivado = value ?? true;
              setState(() {});
            },),
        */

          SwitchListTile.adaptive(
            title: Text('Habilitar Slider'),
            value: _sliderActivado, 
            onChanged: (value){
               _sliderActivado = value;
                setState(() {});
            },),

          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: NetworkImage('https://cdn.pixabay.com/photo/2020/07/06/17/51/batman-5377804_1280.png'),
                fit: BoxFit.contain,
                width: _valorSlider,
              ),
            ),
          )
        ],
      )
    );
  }
}