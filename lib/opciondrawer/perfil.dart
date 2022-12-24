import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ella nunca te va a amar', style: TextStyle(fontSize: 25),),
          Text('V:', style: TextStyle(fontSize: 30),),
        ],
      ),),
    );
  }
}