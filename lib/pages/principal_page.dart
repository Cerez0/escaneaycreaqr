
import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/provider/scan_list_provider.dart';
import 'package:flutter_app_qrscanner/provider/ui_provider.dart';
import 'package:flutter_app_qrscanner/widgets/appbar_personalizado.dart';
import 'package:provider/provider.dart';
import 'crearqr_page.dart';
import 'historial_page.dart';

class PrincipalPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return AppBarPersonalizado();

  }
}

class HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;
    //double appBar = uiProvider.visibilidadAppBar;

    // Usar el ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);



    switch( currentIndex ) {

      case 0:
        scanListProvider.cargarScans();
        return HistorialPage();

      case 1:
        return CrearQrPage();

      default:
        return HistorialPage();
    }


  }
}