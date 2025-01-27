import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {

  //////////////////////////// Menu Inferior /////////////////////////////////

  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set setSelectedMenuOpt ( int i) {
    this._selectedMenuOpt = i;
    notifyListeners();
  }


  ////////////////// APPBAR //////////////////////////////////

  String _text = 'Ultimos QR escaneados';
  Icon _icon = new Icon(Icons.delete_forever);


  // Texto AppBar
  String get textAppBar {
    return this._text;
  }

  set textAppBar( String textAppBar) {
    this._text = textAppBar;
    notifyListeners();
  }

  // Icono AppBar
  Icon get iconAppBar {
    return this._icon;
  }

  set iconAppBar (Icon iconAppBar) {
    this._icon = iconAppBar;
    notifyListeners();
  }


}


