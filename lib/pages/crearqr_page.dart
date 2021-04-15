import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/widgets/codigoqr.dart';
import 'package:flutter_app_qrscanner/widgets/inputyboton.dart';

class CrearQrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top:25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InputyBoton(),
          CodigoQr(),
        ],
      ),
    );
  }
}
