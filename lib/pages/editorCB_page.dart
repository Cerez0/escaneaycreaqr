import 'package:flutter/material.dart';
import 'crearqr_page.dart';

class EditorCbPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DatosInputCB args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
    body: Center(
      child: Text(args.datosCampoTexto),
    ),
    );
  }
}
