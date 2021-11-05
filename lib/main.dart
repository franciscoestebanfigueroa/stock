import 'package:flutter/material.dart';

import 'datos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Column(
            children: [
              Container(
                color: Colors.grey.shade300,
                height: 50,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.orange.withAlpha(50),
                  child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(
                              '${lista[index].categoria}',
                              style: TextStyle(color: Colors.red, fontSize: 25),
                            ),
                            Column(
                              children: List.generate(
                                  lista[index].listadoproductos.length,
                                  (x) => Text(
                                      '${lista[index].listadoproductos[x].nombre}')),
                            )
                          ],
                        );
                      }),
                ),
              ))
            ],
          )),
    );
  }
}
