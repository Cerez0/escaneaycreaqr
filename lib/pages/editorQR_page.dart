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

  @override
  Widget build(BuildContext context) {
    final DatosInputQR args = ModalRoute
        .of(context)
        .settings
        .arguments;
    final editorQr = Provider.of<EditorQrProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edita tu Codigo QR'),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.save_alt,
                size: 25.0,
              )),
        ],
      ),
      body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _imagenQr(args.datosCampoTexto, editorQr),
                  _textoDatos(args.datosCampoTexto),
                  Divider(color: Theme
                      .of(context)
                      .primaryColor, height: 20.0,)
                  ,
                ],
              ),
            ),
            Expanded(
              //color: Colors.green,
              //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              //height: 449,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  Container(
                    height: 449,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      children: [
                        _selecColorQR(context, editorQr),
                        _selecColorFondoQr(context, editorQr),
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
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Material(
            elevation: 20.0,
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
    );
  }

  Widget _textoDatos(String textoDatos) {
    return Text(textoDatos);
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
              fontSize: 20.0
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
                fontSize: 20.0
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
}
