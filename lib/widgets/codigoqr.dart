import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/provider/ui_provider.dart';
import 'package:provider/provider.dart';


class CodigoQr extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Size _mediaQuery = MediaQuery.of(context).size;
    return codigoQr(context, _mediaQuery);
  }

  codigoQr( BuildContext context, mediaQuery ) {

    final uiProvider = Provider.of<UiProvider>(context);

    if (uiProvider.datosCampotexto == '' ){
      return Expanded(
        child: Container(
          height: 100,
          alignment: Alignment.center,
          child: Text('No has generado ningún código QR', style: TextStyle(
            color: Colors.black,
          ),),
        ),
      );

    } else {


      return Expanded(
        child: Stack(
          alignment: Alignment.center,
          children: [

            Container(
              width: 200.0,
              height: 200.0,
              foregroundDecoration: BoxDecoration(
                color: Colors.white,

              ),
            ),

             BarcodeWidget(
               height: 200,
               barcode: Barcode.qrCode(),
               data: uiProvider.datosCampotexto,

             ),


          ],
        ),
      );
    }
  }

}





