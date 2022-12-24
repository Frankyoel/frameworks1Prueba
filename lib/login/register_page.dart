import 'dart:async';
import 'package:app01_framework/fonts/letra.dart';
import 'package:app01_framework/login/page_login.dart';
import 'package:app01_framework/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_constructors
class RegisterPage extends StatefulWidget {
     RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  final fullnamecontrol = TextEditingController();
  final emailControl = TextEditingController();
  final passControl = TextEditingController();

 // final Future<SharedPreferences> pref = SharedPreferences.getInstance();
  //final prefs = SharedPreferences.getInstance();
  
  Future<void> guardarDatosUsuario(String fullname) async { 
    final prefs = await SharedPreferences.getInstance();
    if (prefs != null){prefs.setString('fullname',fullname);}
    }


  @override
  // PANTALLA DE INICIO DE SESION 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
            child: Column(
        children: [
            SizedBox(height: 25,),
            bienvenidoText(),
            SizedBox(height: 10,),
            iconosRRSS(),
            textodatos(),
            login(),
            const SizedBox(height: 50),

            ],
      ),
          )),
    );
  }





// wIDGET DE DORMULARIO 
  Form login() {
    final _formKey=GlobalKey<FormState> () ;
    return Form(
      key: _formKey,
      
      onChanged: () {
        
        Form.of(primaryFocus!.context!)!.save();
      },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

            children: [

            user(),

            const SizedBox(height: 15),
            correo(),

            const SizedBox(height: 15),
            WgContrasena(),
            
            const SizedBox(height: 40,),
            botonLogin(_formKey),

            const SizedBox(height: 20,),
            yaTieneCuenta(),


            ],),
          ));
  }

  Row yaTieneCuenta() {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Ya tienes una cuenta?'),
              TextButton(onPressed: (){Navigator.push(context,
             MaterialPageRoute(builder: (context) => LoginPage()));}, child: Text('Login'))
            ],
          );
  }



  ElevatedButton botonLogin(GlobalKey<FormState> _formKey) {

    final ButtonStyle style =
       EstilosBoton(context).registrar;
    final ButtonStyle style2 =
        ElevatedButton.styleFrom(backgroundColor: Colors.white,);
    
    return 
    ElevatedButton(
          
          style: style,
            onPressed: () async
          {
            String fullName = fullnamecontrol.text;
            String email = emailControl.text;
            String password= passControl.text;
            
            if
            (_formKey.currentState!.validate()){
            guardarDatosUsuario(fullName);
            showDialog(  

      context: context,
      builder: (context) => AlertDialog(
        
        title: const Text('Completado'),
        content:  Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text('Informacion registrada:'),
             Text('El usuario es:  $fullName'),
             Text('El correo es:   $email') ,
             
            ],
          ),
        ),
        insetPadding: EdgeInsets.only(bottom: 10),
        actions: <Widget>[
          ElevatedButton(
  
            onPressed: () {
             Navigator.pop(context);
             Navigator.push(context,
               MaterialPageRoute(builder: (context) => HomePage2()));
            },
            child: const Text('Aceptar',style: TextStyle(color: Colors.white))

          ),
          SizedBox(width:5 ,),

            ElevatedButton(
            style: style2,
            onPressed: () { Navigator.pop(context);},
            child: const Text('Cancelar', style: TextStyle(color: Colors.blue),),
          ),
        ],
      ),
    );};},
          child: const Text('Registrar',
          style: TextStyle( 
            fontFamily: 'rubik',
            color: Colors.black,
            fontSize: 13,
            letterSpacing: 1
           ),   
          ),
          
        );
  }

  Column user() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nombre de usuario:'),
        const SizedBox(height: 10,),
      
            TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
               if (value==null||value.isEmpty){
                return
              "No puede estar vacio"; }
            },
            controller: fullnamecontrol,
            decoration: InputDecoration( 
              hintText: 'Ingrese su nombre de usuario',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              )
            )
           ),],
         );
  }


  Column correo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email:'),
        const SizedBox(height: 10,),
      
            TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
               if (!value!.contains('@') || !value.contains('.com')|| value.isEmpty){
                return
              "Escriba un correo valido"; }
            },
            controller: emailControl,
            decoration: InputDecoration( 
              hintText: 'Ingrese su correo',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              )
            )
           ),],
         );
  }
 



  Row iconosRRSS() { //Logos de incio de sesion(3)
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: const Icon(
              Icons.facebook,
              color: Colors.blue,
            )),
            
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            margin: EdgeInsets.all(30),
            child: Icon(
              FontAwesomeIcons.google,
              color: Colors.orange
            )),

        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            margin: EdgeInsets.symmetric(horizontal: 30),
            child:const Icon(
              FontAwesomeIcons.instagram,
              color: Colors.redAccent,
            )),

      ],
    );
  }
  SizedBox textodatos() {
    MainAxisAlignment.start;
    return SizedBox(
          height:20,
          child: Text('o registrate con tu correo:', 
        style: GoogleFonts.nunito(fontSize: 15)),);
  }
  Column bienvenidoText() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text('Bienvenido',
        style: TextStyle(fontSize: 17, fontFamily: 'rubik'),),
        Text('registrate a continuacion con:',
        style: GoogleFonts.nunito(fontSize: 15, color: Colors.grey))],
    );
  }
}


class WgContrasena extends StatefulWidget {


  @override
  State<WgContrasena> createState() => _WgContrasena();
}

class _WgContrasena extends State<WgContrasena> {

  final passControl = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contraseña: '),
        SizedBox(height: 10,),
       TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _isObscure,
                controller: passControl,
                validator: (String? value) {
                  return (value==null || value.length <= 7)
                  ? "Su contraseña debe tener 8 digitos "
                  : null;
                },
                decoration:  InputDecoration( 
                  hintText: 'Ingrese su contraseña',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton( 
                  onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility_sharp
                            : Icons.visibility_off_rounded)
                   
                 ),
               ),
             ),
      ],
    );
  }
  }
