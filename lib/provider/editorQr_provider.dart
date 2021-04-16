import 'package:flutter/material.dart';

class EditorQrProvider extends ChangeNotifier {

    //////////////////// Color QR ////////////////////////////

  Color _colorQr = Colors.black;

  Color get colorQr => this._colorQr;

  set setColorQr( Color colorQr){
    this._colorQr = colorQr;
    notifyListeners();
  }

  //////////////////// Color Fondo QR ////////////////////////////

  Color _colorFondoQr = Colors.white;

  Color get colorFondoQr => this._colorFondoQr;

  set setColorFondoQr( Color colorFondoQr){
    this._colorFondoQr = colorFondoQr;
    notifyListeners();
  }
}