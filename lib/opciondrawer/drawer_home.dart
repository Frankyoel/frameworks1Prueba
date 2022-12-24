// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:app01_framework/fonts/letra.dart';
import 'package:app01_framework/opciondrawer/perfil.dart';
import 'package:app01_framework/opciondrawer/temasdrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {

   Future<void> guardarDatosUsuario(String fullname) async { 
    final prefs = await SharedPreferences.getInstance();
    if (prefs != null){prefs.setString('fullname',fullname);}
    }

    Future<String> _getSaveFullname() async { 
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('fullname')??'';
    }
    

  @override
  Widget build(BuildContext context) {
    
    return Drawer(child:
     Column(
      
      // ignore: prefer_const_literals_to_create_immutables
      children: [
      const SizedBox(height: 20,),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage("https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg?compress=1&resize=1600x1200&vertical=top"),
        ),
        const SizedBox(height: 20,),
        Text('Bienvenido', style: Estilosletra(context).letradrawer), 
        const SizedBox(height: 5,),

// Mostrar el nombre dek usuario gestristrado
        FutureBuilder(
          future: _getSaveFullname(),
          builder: (context, snapshot) {
    if (snapshot.hasData)
    { return Text('${snapshot.data}', style: TextStyle(fontSize: 20),); 
    }else {return Text('');}
        }),
        const SizedBox(height: 20,),

        Divider(
          color: Colors.blue,

        ),
        
       ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil()));},
        title: Text('Tu perfil'),
        leading: Icon(Icons.person),
       ),

              ListTile(
        onTap: () {
          
        },
        title: Text('Contraseña'),
        leading: Icon(Icons.person),
       ),

              ListTile(
                onTap: () {
          
        },
        title: Text('Eventos'),
        leading: Icon(Icons.person),
       ),

              ListTile(
                onTap: () {
          
        },
        title: Text('Configuracion'),
        leading: Icon(Icons.person),
       ),

        ListTile(
                onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerTemas()));},
        title: Text('Cambiar estilo de pantalla'),
        leading: Icon(Icons.person),
       )
       

      ],
    )
    );
  }
}