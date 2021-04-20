import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  //////////////////// Titulo QR ////////////////////////////

  String _tituloQr = '';

  String get tituloQr => this._tituloQr;

  set setTituloQr( String tituloQr){
    this._tituloQr = tituloQr;
    notifyListeners();
  }

  //////////////////// Titulo QR ////////////////////////////

  Color _colorTituloQr = Colors.black;

  Color get colorTituloQr => this._colorTituloQr;

  set setColorTituloQr( Color colorTituloQr){
    this._colorTituloQr = colorTituloQr;
    notifyListeners();
  }

  //////////////////// Guardar Codigo QR ////////////////////////////

  ByteData _imagenQR;

  ByteData get imagenQR => this._imagenQR;

  set setimagenQR( ByteData imagenQR){
    this._imagenQR = imagenQR;
    notifyListeners();
  }

  //////////////////// Elevacion Codigo QR ////////////////////////////

  double _elevacionQR = 0;

  double get elevacionQR => this._elevacionQR;

  set setElevacionQR( double elevacionQR){
    this._elevacionQR = elevacionQR;
    notifyListeners();
  }

}


