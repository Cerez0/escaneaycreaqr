
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_qrscanner/pages/editorQR_page.dart';
import 'package:flutter_app_qrscanner/pages/principal_page.dart';
import 'package:flutter_app_qrscanner/provider/editorQr_provider.dart';
import 'package:flutter_app_qrscanner/provider/scan_list_provider.dart';
import 'package:flutter_app_qrscanner/provider/ui_provider.dart';
import 'package:provider/provider.dart';
import 'floatingButton_Personalizado.dart';
import 'navigationBarPersonalizado.dart';

class AppBarPersonalizado extends StatelessWidget {
  
  EditorQRPage editorQRPage = new EditorQRPage();

  @override
  Widget build(BuildContext context) {

    final appBarProvider = Provider.of<UiProvider>(context);
    String _textAppBar = appBarProvider.textAppBar;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 10.0,
            title: Text(
              _textAppBar,
              style: TextStyle(fontFamily: 'georgia'),
            ),
            actions: [
              IconButton(
                  icon: appBarProvider.iconAppBar,
                  onPressed: () {

                    if (appBarProvider.selectedMenuOpt == 0 ) {

                      Provider.of<ScanListProvider>(context, listen: false)
                          .borrarTodos();
                    }else{

                      print('Guardar en PDF');


                      }



                    }


              )
            ],
          ),

          body: HomePageBody(),

          bottomNavigationBar: CustomNavigatorBar(),
          floatingActionButton: CustomButtonScan(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
  }
}
