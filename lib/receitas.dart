import 'package:flutter/material.dart';

class Receitas extends StatefulWidget {
  Receitas({Key? key});

  @override
  State<Receitas> createState() => _MyReceitas();
}

class DescricaoReceitas extends StatelessWidget {
  final String nomeReceita;
  final String descricaoReceita;
  final String precoReceita;

  const DescricaoReceitas({
    Key? key,
    required this.nomeReceita,
    required this.descricaoReceita,
    required this.precoReceita,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            nomeReceita,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            descricaoReceita,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            precoReceita,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _MyReceitas extends State<Receitas> {
  String busca = '';

       final Map<String, Map<String, String>> dados = const {
    'Aperitivos': {
      'Bolinhos de queijo': 'R\$ 15.00',
      'Bruschetta de tomate com majericão': 'R\$ 8.50',
      'Canapés de salmão com cream cheese': 'R\$ 32.00',
    },
    'Pratos Principais': {
      'Frango assado com batatas': 'R\$28.00',
      'Espaguete à bolonhesa': 'R\$25.00',
      'Risoto de cogumelos': 'R\$15.50',
    },
    'Sobremesas': {
      'Torta de maçã': 'R\$15.90',
      'Mousse de chocolate': 'R\$12.00',
      'Pudim de leite': 'R\$1 4.80',
    },
    'Bebidas': {
      'Caipirinha': 'R\$5.00',
      'Martini': 'R\$6.00',
      'Margarita': 'R\$7.00',
    },
    'Petisco': {
      'Batata frita': 'R\$10.00',
      'Isca de peixe': 'R\$10.50',
      'Aneis de cebola': 'R\$11.00',
    }
  };

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, Map<String, String>>> entries =
        dados.entries.toList();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: TextFormField(
              initialValue: busca,
              onChanged: (value) {
                setState(() {
                  busca = value;
                });
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Buscar prato',
                labelStyle: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: entries.map((categoria) {
            return Wrap(
              alignment: WrapAlignment.start,
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
                ...categoria.value.entries.map((entry) {
                  final nomeReceita = entry.key;
                  final precoReceita = entry.value;
                  if (nomeReceita.contains(busca) || busca.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 242, 8),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 250, 8)),
                      ),
                      child: TextButton(
                        child: Column(
                          children: [
                            Text(nomeReceita,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            Icon(Icons.restaurant_menu),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescricaoReceitas(
                                nomeReceita: nomeReceita,
                                descricaoReceita: "Descrição da $nomeReceita",
                                precoReceita: precoReceita,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                }).toList(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}