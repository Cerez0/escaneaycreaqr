import 'package:flutter/material.dart';

class CrearQrPage extends StatelessWidget {
  String datosInputText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          children: [
            _cardCodigoQR(context),
            _cardCodigoDeBarras(),
          ],
        ));
  }

  /////////////////// CREAR CODIGOS QR ////////////////////////////////

  Widget _cardCodigoQR(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      height: 250,
      child: Card(

        color: Theme.of(context).primaryColor,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _tituloQR(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _campoTextoQR(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _botonGenerarQR(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tituloQR(BuildContext context) {
    return Text(
      'Codigo QR',
      style: TextStyle(
        fontSize: 32.0,
        color: Colors.white,
      ),
    );
  }

  Widget _campoTextoQR() {
    return TextField(
      cursorHeight: 30.0,
      style: TextStyle(
        fontSize: 20.0
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'Ej: http://www.google.es',
      ),
      onChanged: (String texto) {
        datosInputText = texto;
      },
    );
  }

  Widget _botonGenerarQR(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white)
      ),
        child: Text('Generar Codigo QR',style: TextStyle(
          color: Colors.black,
        ),),
        onPressed: () {
          print(datosInputText);
          DatosInputQR datosInputQR = DatosInputQR(datosInputText);
          Navigator.pushNamed(context, 'editorQr', arguments: datosInputQR);
        });
  }

  /////////////////CREAR CODIGOS DE BARRAS/////////////////////////

  Widget _cardCodigoDeBarras() {
    return Container(
      height: 250,
      child: Card(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: Colors.red,
            width: 3.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _tituloCB(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _campoTextoCB(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _botonGenerarCB(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tituloCB() {
    return Text(
      'Codigo de Barras',
      style: TextStyle(fontSize: 32.0),
    );
  }

  Widget _campoTextoCB() {
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
      onChanged: (String texto) {},
    );
  }

  Widget _botonGenerarCB() {
    return ElevatedButton(
        child: Text('Generar Codigo de barras'), onPressed: () {});
  }
}

class DatosInputQR {
  String datosCampoTexto;

  DatosInputQR(this.datosCampoTexto);
}
