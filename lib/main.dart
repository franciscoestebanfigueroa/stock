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
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 100.0, keepScrollOffset: false);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    widget.scrollController.addListener(() {
      setState(() {
        print('escucho ${widget.scrollController.offset}');
      });
    });

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
                    WTabs(state: state),
                    Expanded(
                        child: Container(
                      child: ListView.builder(
                          controller: widget.scrollController,
                          itemCount: state.datos.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  print(
                                      'on tap ${widget.scrollController.offset} ');
                                  widget.scrollController = ScrollController(
                                      initialScrollOffset: 300,
                                      keepScrollOffset: false);
                                });
                              },
                              child: WProductos(
                                index: index,
                                state: state,
                              ),
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
