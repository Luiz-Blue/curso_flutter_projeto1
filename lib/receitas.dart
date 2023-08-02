import 'package:flutter/material.dart';

class Receitas extends StatelessWidget {
  Receitas({Key? key});

  final String? categoriaUsuario = null;
  final String busca = '';

  final Map<String, List<String>> dados = const {
    'Aperitivos': [
      'Bolinhos de queijo',
      'Bruschetta de tomate com majericão',
      'Canapés de salmão com cream cheese',
    ],
    'Pratos Principais': [
      'Frango assado com batatas',
      'Espaguete à bolonhesa',
      'Risoto de cogumelos',
    ],
    'Sobremesas': [
      'Torta de maçã',
      'Mousse de chocolate',
      'Pudim de leite',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, List<String>>> entries = dados.entries.toList();
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
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: entries.map((categoria) {
          if (categoriaUsuario == null || categoriaUsuario == categoria.key) {
            return Wrap(
              // FLAG
              //mainAxisSize: MainAxisSize.min,
              alignment: WrapAlignment.start, 
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (busca.isEmpty)
                  Center(
                    child: Text(
                      categoria.key,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                
                ...categoria.value.map((dados) {
                  if (dados.contains(busca) || busca.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Text(
                        dados,
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  } else {
                    return Container(); 
                  }
                }).toList(),
              ],
            );
          } else {
            return Container();
          }
        }).toList(),
      ),
    );
  }
}
