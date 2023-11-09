import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({super.key});
  final opciones = ['Uno', 'Dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Componentes Temp')),
        body: ListView(children: _crearItemsCorto()));
  }

  List<Widget> _crearItems() {
    List<Widget> lista = <Widget>[];

    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista.add(tempWidget);
      lista.add(const Divider());
    }
    return lista;
  }

// crear lista de items
  List<Widget> _crearItemsCorto() {
    var widgets = opciones.map(
      (item) {
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.label),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('$item!'),
              //title: Text(item + '!'),
              subtitle: Text('Texto alternativo'),
              onTap: (){
                
              },
            ),
            Divider(),
          ],
        );
      },
    ).toList();

    return widgets;
  }
}
