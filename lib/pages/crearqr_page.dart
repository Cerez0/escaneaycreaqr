import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/provider/editorQr_provider.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

class CrearQrPage extends StatelessWidget {
  String datosInputTextQR = '';
  

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
            ],
          ),
        ));
  }

  /////////////////// CREAR CODIGOS QR ////////////////////////////////

  Widget _cardCodigoQR(BuildContext context, MediaQueryData mediaQuery, EditorQrProvider editorQrProvider) {


    return Container(
        margin: EdgeInsets.only(bottom: 30.0),
        height: mediaQuery.size.height / 3.5,
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
                _tituloQR(context),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _campoTextoQR(context, mediaQuery),
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
        'Generador Codigo QR',
        style: TextStyle(
          //fontSize: 32.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _campoTextoQR(BuildContext context, MediaQueryData mediaQueryData) {

    double anchoPantalla = mediaQueryData.size.width;
    double altoPantalla = mediaQueryData.size.height;

    return Container(
      width: anchoPantalla * 0.6,
      height: altoPantalla * 0.04,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 7.0),
          hintStyle: TextStyle(
            fontSize: anchoPantalla * 0.035
          ),
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
          backgroundColor: MaterialStateProperty.all(Colors.white),

        ),
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


}

class DatosInputQR {
  String datosCampoTexto;

  DatosInputQR(this.datosCampoTexto);
}


