
import 'package:flutter/material.dart';
import 'package:flutter_app_qrscanner/provider/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
        onTap: (int i) {
          uiProvider.setSelectedMenuOpt = i;

          // Titulo AppBar
          if ( i == 0){
            uiProvider.textAppBar = 'Ultimos QR escaneados';
          }else{
            uiProvider.textAppBar = 'Crea tu codigo';
          }

          // Icono AppBar

          if ( i == 0){
            uiProvider.iconAppBar = Icon(Icons.delete_forever);
          }else{
            uiProvider.iconAppBar = Icon(null);
          }


        },
        //fixedColor: Colors.black,
        currentIndex: currentIndex,
        elevation: 20.0,
        items: [
          BottomNavigationBarItem(
            label: 'Historial',
            icon: Icon(Icons.history_rounded, size: 25.0),

          ),

          BottomNavigationBarItem(
              label: 'Crear QR',
              icon: Icon(Icons.qr_code, size: 25.0)
          ),
        ]
    );
  }
}