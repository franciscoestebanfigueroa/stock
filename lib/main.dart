import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock/Widget/wcardproductos.dart';
import 'package:stock/Widget/wtabs.dart';
import 'package:stock/bloc/block_bloc.dart';

import 'bloc/block_bloc.dart';

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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

ScrollController scrollController =
    ScrollController(initialScrollOffset: 0.0, keepScrollOffset: false);

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
                    WTabs(state: state, scrollController: scrollController),
                    Expanded(
                        child: Container(
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: state.datos.length,
                          itemBuilder: (context, index) {
                            final double to;
                            final double from;
                            final st = state.datos;
                            if (index == 0) {
                              from = 0.0;
                              to = state.alturacategorias +
                                  (state.datos[index].cantidadproductos) *
                                      state.alturaproductos;
                            } else {
                              from = st[index - 1].to;
                              to = from +
                                  (st[index].cantidadproductos) *
                                      state.alturaproductos +
                                  (state.alturacategorias);
                            }

                            BlocProvider.of<BlockBloc>(context).add(
                                EScroller(index: index, from: from, to: to));

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
