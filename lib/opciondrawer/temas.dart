// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


class Themechanger with ChangeNotifier{
  ThemeData _themeData;
  Themechanger(this._themeData);

   getTheme() => _themeData;

   setTheme(ThemeData theme){
    this._themeData = theme;
    
    notifyListeners();
  } 
}
ThemeData Tema1() {
    return ThemeData(
                primaryColor: Colors.blue,
                backgroundColor: Colors.blueAccent,
                scaffoldBackgroundColor: Colors.blue,
                appBarTheme: const AppBarTheme(color: Colors.blue),
              );
  }


ThemeData Tema2() {
    return ThemeData(
                primaryColor: Colors.orange,
                backgroundColor: Colors.amber,
                scaffoldBackgroundColor: Colors.orange,
                appBarTheme: const AppBarTheme(color: Colors.orange),
              );
  }



class Producto{
  int? sku;
  String? nombre;

  Producto(this.sku, this.nombre);
}

final product = Producto(1, 'btb');