import 'package:flutter/material.dart';

class Receitas extends StatelessWidget {
  const Receitas({Key? key});

  final Map<String, List<String>> dados = const {
    'Aperitivos': [
      'Bolinhos de queijo',
      'Bruschetta de tomate com majericão',
      'Canapés de salmão com cream cheese',
    ],
    'Pratos Principais': [
      'Frango assado com batatas',
      'Espaguete à bolinhesa',
      'Risoto de cogumelos',
    ],
    'Sobremesas': [
      'Torta de maça',
      'Mousse de chocolate',
      'Pudim de leite',
    ],
  };
  int? categoria = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
        ),
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Minhas Receitas',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              dados.entries.first.key,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )),
            for (String elemento in dados.entries.first.value)
              Text(
                elemento,
                style: TextStyle(fontSize: 18),
              ),
            Center(
                child: Text(dados.entries.elementAt(1).key,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
            for (String elemento in dados.entries.elementAt(1).value)
              Text(
                elemento,
                style: TextStyle(fontSize: 18),
              ),
            Center(
                child: Text(dados.entries.last.key,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
            for (String elemento in dados.entries.last.value)
              Text(
                elemento,
                style: TextStyle(fontSize: 18),
              ),
          ],
        ));
  }
}
