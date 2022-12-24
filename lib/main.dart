import 'package:app01_framework/login/register_page.dart';
import 'package:app01_framework/opciondrawer/temas.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override


  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Themechanger(ThemeData.light()),
      child: TemaMaterialApp(


      ),
    );
  }
}

class TemaMaterialApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Theme=Provider.of<Themechanger> (context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: RegisterPage(),
        theme: Theme.getTheme(),
        title: 'AAcceso a cuenta - login',
       // theme: ThemeData(brightness: Brightness.light),    
    );
  }
}

