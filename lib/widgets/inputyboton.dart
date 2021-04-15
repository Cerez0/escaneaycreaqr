import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/provider/ui_provider.dart';
import 'package:provider/provider.dart';

class InputyBoton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String valorInput;
    final uiProvider = Provider.of<UiProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          _inputText(valorInput),
          SizedBox(
            height: 20.0,
          ),
          _botonGenerar(context, valorInput),
        ],
      ),
    );
  }

  Widget _inputText(String valorInput) {

    return TextField(

      style: TextStyle(color: Colors.black),
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: 'Escribe aqui la direccion',
        labelStyle: TextStyle(color: Colors.black),
        hintText: 'Ej: http://www.google.es',
      ),
      onChanged: (String texto) {
        valorInput = texto;
      },
    );
  }

  Widget _botonGenerar(BuildContext context, String valorInput) {

    final uiProvider = Provider.of<UiProvider>(context);

    return ElevatedButton(
        style: ButtonStyle(
            //backgroundColor: MaterialStateProperty.all(Colors.black),
            overlayColor: MaterialStateProperty.all(Colors.green),
            side: MaterialStateProperty.all(BorderSide(
                color: Colors.white, width: 1.0, style: BorderStyle.solid))),
        child: Text('Generar Codigo QR'),
        onPressed: () {
          uiProvider.datosCampotexto = valorInput;
          print('Valor Input:' + valorInput);
        });
  }
}
