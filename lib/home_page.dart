import 'package:app01_framework/opciondrawer/drawer_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
String? FullName;

  @override
  void initState() {
    
    super.initState();
  }
  

  Future<void> validateuser() async{
     final prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
                appBar: AppBar(actions: [
                  ElevatedButton(onPressed: () {Navigator.pop(context);
                  
                }, 
                child: const Icon(Icons.exit_to_app_sharp))],),
                drawer: DrawerHome(),
                body: Center(child: Text('Se sufrio pero logramos esto')),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButton: FloatingActionButton(onPressed: () {
                
    },
    
    child: Icon(Icons.add),),
               );
  }
}


