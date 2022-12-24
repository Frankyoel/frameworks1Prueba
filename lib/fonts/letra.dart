import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Estilosletra {
  final BuildContext context;
  Estilosletra(this.context);

  TextStyle get textGlobal {
    return GoogleFonts.nunito(
        fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);
  }

   TextStyle get bienvenido {
    return const TextStyle( 
        fontSize: 13, color: Colors.black,letterSpacing: 1 , fontFamily: 'rubik');
  }

  TextStyle get subTitleRegister {
    return GoogleFonts.nunito(
        fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16);
  }

  TextStyle get letradrawer {
    return GoogleFonts.nunito();}}



class EstilosBoton{
  final BuildContext context;
  EstilosBoton(this.context);

  ButtonStyle get registrar{
    return ElevatedButton.styleFrom(padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 110) , backgroundColor: Colors.green);
  }}