

import 'dart:typed_data';
import 'dart:ui';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_qrscanner/pages/crearqr_page.dart';
import 'package:flutter_app_qrscanner/provider/editorQr_provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class EditorQRPage extends StatelessWidget {
  Color _colorQR = Colors.black;
  Color _colorFondoQR = Colors.white;
  String _tituloQr = '';
  Color _colorTituloQr = Colors.black;

  final _keyBoundary = GlobalKey();
  Uint8List _memoryImage;

  @override
  Widget build(BuildContext context) {

    final DatosInputQR argsQR = ModalRoute.of(context).settings.arguments;
    final editorQr = Provider.of<EditorQrProvider>(context);
    _tituloQr = editorQr.tituloQr;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Editor'),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 5.0),
              child: Row(
                children: [

                  IconButton(
                    icon: Icon(Icons.save_alt),
                    onPressed: (){
                      //editorQr.setElevacionQR = 0.0;
                      capturaImagen(context, editorQr);
                    },
                  ),
                ],
              ),
          ),
        ],
      ),
      body: Column(
          children: [
            Container(
                //color: Colors.red,
                padding: EdgeInsets.only(top: 15.0),
                //alignment: Alignment.center,
                child:RepaintBoundary(
                  key: _keyBoundary,
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        _imagenQr(argsQR.datosCampoTexto, editorQr),
                        _textoDatos(editorQr.tituloQr, editorQr),
                        //SizedBox(height: 20.0),
                      ],
                    ),
                ),
                ),



            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 50.0, top: 20.0, right: 50.0),
                children: [
                  Container(
                    height: 449,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18.0,
                      mainAxisSpacing: 18.0,
                      children: [
                        _selecColorQR(context, editorQr),
                        _selecColorFondoQr(context, editorQr),
                        _cambiarTexto(context, editorQr),
                        _selecColorTituloQr(context, editorQr),
                      ],

                    ),
                  ),
                ],

              ),
            ),
          ],
        ),

    );
  }

  Widget _imagenQr(String urlQr, EditorQrProvider editorQr) {
    return BounceInDown(
      duration: Duration(seconds: 2),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Material(
              elevation: 0.0,
              child: Container(
                width: 200.0,
                height: 200.0,
                foregroundDecoration: BoxDecoration(
                  color: editorQr.colorFondoQr,
                ),
              ),
            ),
            BarcodeWidget(

              color: editorQr.colorQr,
              height: 200,
              barcode: Barcode.qrCode(),
              data: urlQr,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textoDatos(String textoDatos, EditorQrProvider editorQr) {
    return ElasticInRight(
      child: Container(
        child: Text(textoDatos, style: TextStyle(
          fontSize: 16.0,
          color: editorQr.colorTituloQr
        ),),
      ),
    );
  }

  //////Guardar Imagen ///////

  void capturaImagen(BuildContext context, EditorQrProvider editorQrProvider) async {

    final RenderRepaintBoundary renderRepaintBoundary = _keyBoundary.currentContext.findRenderObject();
    final image = await renderRepaintBoundary.toImage();
    final bytes = await image.toByteData(format: ImageByteFormat.png);


    _memoryImage =  bytes.buffer.asUint8List();
    _showAlertDialogGuardarImagen(context, editorQrProvider);
  }

  void _showAlertDialogGuardarImagen(BuildContext context, EditorQrProvider editorQR)  async{

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (buildcontext) {
          return FlipInX(
            child: AlertDialog(
              contentPadding: EdgeInsets.all(0.0),
              content: SingleChildScrollView(
                  child: Container(
                    //color: Colors.red,
                    alignment: Alignment.center,
                    child: Column(
                      children: [

                        Container(
                          width: double.infinity,
                          alignment: Alignment.topRight,
                          //color: Colors.red,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          ),
                        ),

                        Image.memory(_memoryImage),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              SizedBox(
                                width: 100.0,
                                child: ElevatedButton(
                                  child: Icon(Icons.share),
                                  onPressed: () async {
                                    Share.file('Codigo QR', 'qrImagen.png', _memoryImage, 'image/png');
                                    //Navigator.of(context).pop();
                                  },
                                ),
                              ),

                              SizedBox(
                                width: 100.0,
                                child: ElevatedButton(
                                  child: Text("Guardar", style: TextStyle(color: Colors.white),),
                                  onPressed: () async {
                                    //Share.file('Codigo QR', 'qrImagen.png', _memoryImage, 'image/png');

                                  },
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  )
              ),





            ),
          );
        }
    );
  }

  //////Cambiar color QR ///////

  Widget _selecColorQR(BuildContext context, EditorQrProvider editorQr) {
    return Container(
      height: 200,
      child: MaterialButton(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.palette,size: 50.0,),
            Text('Color QR',style: TextStyle(
              //fontSize: 20.0
            ),),
          ],
        ),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () {
          _showAlertDialogQR(context, editorQr);
        },
      ),
    );
  }

  void _showAlertDialogQR(BuildContext context, EditorQrProvider editorQR) {

    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(

            title: Text("Cambiar Color QR"),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: _colorQR,
                onColorChanged: changeColorQR,
                showLabel: true,
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text("SELECCIONAR", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  editorQR.setColorFondoQr = _colorFondoQR;
                  editorQR.setColorQr = _colorQR;
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  void changeColorQR(Color color) {

     _colorQR = color;
  }



  //////Cambiar color Fondo ///////

  Widget _selecColorFondoQr(BuildContext context, EditorQrProvider editorQr) {
    return Container(
      child: MaterialButton(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.format_color_fill, size: 50.0),
            Text('Color Fondo',style: TextStyle(
                //fontSize: 20.0
            ),),
          ],
        ),
        color: Theme
            .of(context)
            .primaryColor,
        textColor: Colors.white,
        onPressed: () {
          _showAlertDialogFondo(context, editorQr);
        },
      ),
    );
  }

  void _showAlertDialogFondo(BuildContext context, EditorQrProvider editorQR) {

    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(

            title: Text("Cambiar Color Fondo QR"),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: _colorFondoQR,
                onColorChanged: changeColorFondo,
                showLabel: true,
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text("SELECCIONAR", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  editorQR.setColorFondoQr = _colorFondoQR;
                  Navigator.of(context).pop();

                },
              )
            ],
          );
        }
    );
  }

  void changeColorFondo(Color color) {

    _colorFondoQR = color;
  }



  //////Cambiar Texto///////

  Widget _cambiarTexto(BuildContext context, EditorQrProvider editorQr) {
    return Container(
      child: MaterialButton(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.text_fields, size: 50.0),
            Text('Texto',style: TextStyle(
                //fontSize: 20.0
            ),),
          ],
        ),
        color: Theme
            .of(context)
            .primaryColor,
        textColor: Colors.white,
        onPressed: () {
          _showAlertDialogCambiarTexto(context, editorQr);
        },
      ),
    );
  }

  void _showAlertDialogCambiarTexto(BuildContext context, EditorQrProvider editorQr) {

    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(

            title: Text("Cambiar Texto"),
            content: TextField(
              decoration: InputDecoration(
                hintText: editorQr.tituloQr
              ),
              onChanged: (textoInput){
                _tituloQr = textoInput;
              },
            ),
            actions: <Widget>[


              ElevatedButton(
                child: Icon(Icons.close),
                onPressed: (){
                  _tituloQr = editorQr.tituloQr;
                  print(_tituloQr);
                  Navigator.of(context).pop();

                },
              ),

              ElevatedButton(
                child: Icon(Icons.verified),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: (){
                  editorQr.setTituloQr = _tituloQr;
                  print(_tituloQr);
                  Navigator.of(context).pop();

                },
              )
            ],
          );
        }
    );
  }


  //////Cambiar color Texto ///////

  Widget _selecColorTituloQr(BuildContext context, EditorQrProvider editorQr) {
    return Container(
      child: MaterialButton(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.format_color_text, size: 50.0),
            Text('Color Texto',style: TextStyle(
              //fontSize: 20.0
            ),),
          ],
        ),
        color: Theme
            .of(context)
            .primaryColor,
        textColor: Colors.white,
        onPressed: () {
          _showAlertDialogColorTexto(context, editorQr);
        },
      ),
    );
  }

  void _showAlertDialogColorTexto(BuildContext context, EditorQrProvider editorQR) {

    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(

            title: Text("Cambiar Color Texto"),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: _colorTituloQr,
                onColorChanged: changeColorTexto,
                showLabel: true,
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text("SELECCIONAR", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  editorQR.setColorTituloQr = _colorTituloQr;
                  print(editorQR.colorTituloQr);
                  Navigator.of(context).pop();

                },
              )
            ],
          );
        }
    );
  }

  void changeColorTexto(Color color) {

    _colorTituloQr = color;
  }



}
