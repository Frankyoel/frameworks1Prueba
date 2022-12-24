import 'package:flutter/material.dart';

class ButtonAlert extends StatelessWidget {
  const ButtonAlert({super.key, required Null Function() onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue
       ),
    );
  }
}
