import 'package:componentes/presentation/widgets.dart';
import 'package:flutter/material.dart';

class FormularioScreen extends StatelessWidget {
   
  const FormularioScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formularios'),),
      body: SingleChildScrollView(
         child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              CustomInputField(labelText: 'Nombre', hintText: 'Nombre del usuario',),
              SizedBox(height: 20,),
              CustomInputField(labelText: 'Apellidos', hintText: 'Apellidos del usuario',),
              SizedBox(height: 20,),
              CustomInputField(labelText: 'Teléfono', hintText: 'Teléfono del usuario', keyboardType: .phone,),
              SizedBox(height: 20,),
              CustomInputField(labelText: 'Email', hintText: 'Correo del usuario', keyboardType: .emailAddress,),
              SizedBox(height: 20,),
              CustomInputField(labelText: 'Contraseña', hintText: 'Password del usuario', obscureText: true,),
              SizedBox(height: 20,),

              DropdownButtonFormField(
                initialValue: 'Admin',
                items: [
                  DropdownMenuItem(child: Text('Administrador'), value: 'Admin',),
                  DropdownMenuItem(child: Text('Superusuario'), value: 'Superuser',),
                  DropdownMenuItem(child: Text('Developer'), value: 'Dveloper',),
                  DropdownMenuItem(child: Text('Jr. Developer'), value: 'Jr',),
                ], 
                onChanged: (value) {
                  print: (value);
                },
              ),




              SizedBox(height: 20,),
              ElevatedButton(onPressed: null, child: Text('Guardar'))

            ],
          ),
          ),
      ),
    );
  }
}

