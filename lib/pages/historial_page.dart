
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/provider/scan_list_provider.dart';
import 'package:flutter_app_qrscanner/widgets/scan_tiles.dart';
import 'package:provider/provider.dart';

class HistorialPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final scanListProvider =  Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    if ( scans.length == 0){
      return Center(
          child: Text('El historial esta vacio',
            style: TextStyle(
              color: Colors.grey
            ),
          )
      );
    }else{
      return BounceInLeft(child: ScanTiles(tipo: 'html'));
    }


  }


}