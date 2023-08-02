import 'package:flutter/material.dart';

class Teste extends StatelessWidget {

  const Teste({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Column(children: [
            Container(
              width: 1,
            )
           ]),
       );
  }
}