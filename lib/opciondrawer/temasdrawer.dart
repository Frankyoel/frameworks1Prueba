import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app01_framework/opciondrawer/temas.dart';

class DrawerTemas extends StatelessWidget {
  const DrawerTemas({super.key});

  @override
  Widget build(BuildContext context) {
        final Theme=Provider.of<Themechanger> (context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  FloatingActionButton(
                    child: const Icon(Icons.sunny),
                    onPressed: ()=> Theme.setTheme(Tema2())),
                    const Text('Escoger el tema amarillo')
                ],
              ),
              Row(
                children: [
                  FloatingActionButton(
                    child: const Icon(Icons.sunny),
                    onPressed: ()=> Theme.setTheme(Tema1())),
                    const Text('Escoger el tema amarillo')
                ],
              )
            ],
          ),
        ) ),
    );
  }
}