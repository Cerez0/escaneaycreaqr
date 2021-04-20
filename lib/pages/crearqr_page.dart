import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/provider/editorQr_provider.dart';
import 'package:flutter_app_qrscanner/provider/ui_provider.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

class CrearQrPage extends StatelessWidget {
  String datosInputTextQR = '';
  String datosInputTextCB = '';
  

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    EditorQrProvider editorQrProvider = Provider.of<EditorQrProvider>(context);


    return Container(
      alignment: Alignment.center,
        //padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _cardCodigoQR(context, mediaQuery, editorQrProvider),
              _cardCodigoDeBarras(context, mediaQuery),
            ],
          ),
        ));
  }

  /////////////////// CREAR CODIGOS QR ////////////////////////////////

  Widget _cardCodigoQR(BuildContext context, MediaQueryData mediaQuery, EditorQrProvider editorQrProvider) {


    return Container(
        margin: EdgeInsets.only(bottom: 30.0),
        height: mediaQuery.size.height / 4,
        width: mediaQuery.size.width / 1.5,
        
        child: SlideInLeft(
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
                      _botonGenerarQR(context, editorQrProvider),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget _tituloQR(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Text(
        'Codigo QR',
        style: TextStyle(
          //fontSize: 32.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _campoTextoQR() {
    return Container(
      width: 220,
      height: 30,
      child: TextField(

        //cursorHeight: 16.0,
        //style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
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
          datosInputTextQR = texto;
        },
      ),
    );
  }

  Widget _botonGenerarQR(BuildContext context, EditorQrProvider editorQrProvider) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Text(
          'Generar',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {
          print(datosInputTextQR);
          DatosInputQR datosInputQR = DatosInputQR(datosInputTextQR);
          editorQrProvider.setTituloQr = datosInputTextQR;
          Navigator.pushNamed(context, 'editorQr', arguments: datosInputQR);
        });
  }

  /////////////////CREAR CODIGOS DE BARRAS/////////////////////////

  Widget _cardCodigoDeBarras(BuildContext context, MediaQueryData mediaQuery) {

    UiProvider uiProvider = Provider.of<UiProvider>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      height: mediaQuery.size.height / 4,
      width: mediaQuery.size.width / 1.5,
      
      child: SlideInRight(
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
              _tituloCB(context),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _campoTextoCB(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _botonGenerarCB(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tituloCB(BuildContext context) {
    return Text(
      'Codigo de Barras',
      style: TextStyle(
        //fontSize: 32.0,
        color: Colors.white,
      ),
    );
  }

  Widget _campoTextoCB() {
    return Container(
      width: 220,
      height: 30,
      child: TextField(

        //cursorHeight: 16.0,
        //style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: 'Ej: ',
        ),
        onChanged: (String texto) {
          datosInputTextCB = texto;
        },
      ),
    );
  }

  Widget _botonGenerarCB(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Text(
          'Generar',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {
          print(datosInputTextCB);
          DatosInputCB datosInputCB = DatosInputCB(datosInputTextCB);
          Navigator.pushNamed(context, 'editorCB', arguments: datosInputCB);
        });
  }
}

class DatosInputQR {
  String datosCampoTexto;

  DatosInputQR(this.datosCampoTexto);
}

class DatosInputCB {
  String datosCampoTexto;

  DatosInputCB(this.datosCampoTexto);
}


