import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/pages/editorCB_page.dart';
import 'package:flutter_app_qrscanner/pages/editorQR_page.dart';
import 'package:flutter_app_qrscanner/pages/principal_page.dart';
import 'package:flutter_app_qrscanner/provider/editorQr_provider.dart';
import 'package:flutter_app_qrscanner/provider/ui_provider.dart';
import 'package:provider/provider.dart';
import 'provider/scan_list_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new EditorQrProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'Georgia',
        ),
        initialRoute: 'principal',
        routes: {
          'principal' : (_) => PrincipalPage(),
          'editorQr' : (_) =>  EditorQRPage(),
          'editorCB' : (_) =>  EditorCbPage(),
        },
      ),
    );
  }
}


