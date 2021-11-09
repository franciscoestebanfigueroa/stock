import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock/Widget/wcardproductos.dart';
import 'package:stock/Widget/wtabs.dart';

import 'bloc/block_bloc.dart';
import 'datos.dart';

void main() => runApp(MyAppBloc());

class MyAppBloc extends StatelessWidget {
  const MyAppBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlockBloc(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuevo Stock',
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Nuevo Stock'),
            ),
            body: BlocBuilder<BlockBloc, BlockState>(
              builder: (context, state) {
                return Column(
                  children: [
                    WTabs(state: state),
                    Expanded(
                        child: Container(
                      child: ListView.builder(
                          itemCount: lista.length,
                          itemBuilder: (context, index) {
                            return WProductos(
                              index: index,
                              state: state,
                            );
                          }),
                    ))
                  ],
                );
              },
            )),
      ),
    );
  }
}
