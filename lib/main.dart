import 'package:flutter/material.dart';

import 'datos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> lw = lista
        .map((e) => Card(
            elevation: 20,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${e.categoria}',
                ),
              ),
            )))
        .toList();

    return MaterialApp(
      title: 'Nuevo Stock',
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Nuevo Stock'),
            ),
            body: Column(
              children: [
                Container(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: lw,
                  ),
                  height: 50,
                ),
                Expanded(
                    child: Container(
                  child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.all(15),
                          elevation: 10,
                          shadowColor: Colors.orange,
                          child: Column(
                            children: [
                              Text(
                                '${lista[index].categoria}',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 25),
                              ),
                              Column(
                                children: List.generate(
                                    lista[index].listadoproductos.length,
                                    (x) => Text(
                                        '${lista[index].listadoproductos[x].nombre}',
                                        style: TextStyle(fontSize: 20))),
                              )
                            ],
                          ),
                        );
                      }),
                ))
              ],
            )),
      ),
    );
  }
}
