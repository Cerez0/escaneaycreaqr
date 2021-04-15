
import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/provider/scan_list_provider.dart';
import 'package:flutter_app_qrscanner/utils/utils.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class CustomButtonScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.white,
              width: 2.0
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.qr_code_scanner),
        onPressed: () async{
          //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Atras', false, ScanMode.QR);
          final barcodeScanRes = 'https://google.es';
          //final barcodeScanRes = '38.272453,-0.713501';

          if ( barcodeScanRes == '-1'){
            return;
          }

          final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
          final nuevoScan = scanListProvider.nuevoScan(barcodeScanRes);

          abrirURL(context, nuevoScan);


        }
    );
  }
}