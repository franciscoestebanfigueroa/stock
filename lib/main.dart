import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/block_bloc.dart';
import 'datos.dart';
import 'model.dart';

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
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: lista.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> ltab = lista
        .map((e) => Tab(
              child: Text(
                '${e.categoria}',
                style: TextStyle(color: Colors.black),
              ),
            ))
        .toList();

    return MaterialApp(
      title: 'Nuevo Stock',
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Nuevo Stock'),
            ),
            body: BlocBuilder<BlockBloc, BlockState>(
              builder: (context, state) {
                print(state.nombre);
                return Column(
                  children: [
                    Container(
                      child: TabBar(
                        onTap: (index) {
                          print(index);
                        },
                        isScrollable: true,
                        tabs: ltab,
                        controller: tabController,
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
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 25),
                                  ),
                                  Column(
                                    children: List.generate(
                                        lista[index].listadoproductos.length,
                                        (x) => Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              height: 50,
                                              width: double.infinity,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                elevation: 11,
                                                color: Colors.white,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 28),
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        foregroundColor:
                                                            Colors.amber,
                                                        backgroundColor:
                                                            Colors.grey[200],
                                                        child: FlutterLogo(),
                                                        maxRadius: 15,
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                          '${lista[index].listadoproductos[x].nombre}',
                                                          style: TextStyle(
                                                              fontSize: 20)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                  )
                                ],
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

class CardTag extends StatelessWidget {
  final Categorias e;
  const CardTag({
    required this.e,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 20,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${e.categoria}',
            ),
          ),
        ));
  }
}
