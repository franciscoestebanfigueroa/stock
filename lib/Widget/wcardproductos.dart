import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock/bloc/block_bloc.dart';

class WProductos extends StatefulWidget {
  final index;
  final BlockState state;
  const WProductos({
    Key? key,
    this.index,
    required this.state,
  }) : super(key: key);

  @override
  _WProductosState createState() => _WProductosState();
}

class _WProductosState extends State<WProductos> {
  @override
  void initState() {
    final cp = widget.state.datos[widget.index].listadoproductos.length;
//pasamos la cantidad de producto a un item en categoria
    BlocProvider.of<BlockBloc>(context).add(ETabs(cp, widget.index));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.blueGrey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              alignment: Alignment.center,
              height: widget.state.alturacategorias,
              child: Text(
                '${widget.state.datos[widget.index].categoria}',
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            ),
          ),
        ),
        Column(
          children: List.generate(
              widget.state.datos[widget.index].listadoproductos.length, (x) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: widget.state.alturaproductos,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 11,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    children: [
                      CircleAvatar(
                        foregroundColor: Colors.amber,
                        backgroundColor: Colors.grey[200],
                        child: FlutterLogo(),
                        maxRadius: 15,
                      ),
                      Spacer(),
                      Text(
                          '${widget.state.datos[widget.index].listadoproductos[x].nombre}',
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
