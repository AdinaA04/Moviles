import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool obscureText;

  final TextInputType? keyboardType;

  const new({
    super.key,
    this.helperText,
    this.hintText,
    this.labelText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: true,
      initialValue: '',
      textCapitalization: .words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: (value) {
        print (value);
      },
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 3 ? 'Mínimo de 3 caracteres' : null;
      },
      autovalidateMode: .onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        //counterText: 'Contador'
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        //prefixIcon: Icon(Icons.group_off_outlined)
        icon: icon == null ? null : Icon(icon),
        /* focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.pinkAccent
          )
        ) ,
        border: OutlineInputBorder(
          borderRadius: .only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          ) 
        ) */
      ), 
    );
  }
}