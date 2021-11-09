import 'package:flutter/material.dart';
import 'package:stock/bloc/block_bloc.dart';

class WProductos extends StatelessWidget {
  final index;
  final BlockState state;
  const WProductos({
    Key? key,
    this.index,
    required this.state,
  }) : super(key: key);

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
              height: state.alturacategorias,
              child: Text(
                '${state.datos[index].categoria}',
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            ),
          ),
        ),
        Column(
          children:
              List.generate(state.datos[index].listadoproductos.length, (x) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: state.alturaproductos,
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
                      Text('${state.datos[index].listadoproductos[x].nombre}',
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
