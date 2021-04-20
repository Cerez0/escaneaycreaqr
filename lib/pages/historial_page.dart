
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/widgets/scan_tiles.dart';

class HistorialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    if ( ScanTiles == null){

    }else{
      return BounceInLeft(child: ScanTiles(tipo: 'html'));
    }


  }


}