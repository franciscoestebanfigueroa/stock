part of 'block_bloc.dart';

@immutable
abstract class BlockState {
  final double alturaproductos = 40;
  final double alturacategorias = 50;
  final double alturatab = 50;
  final List<Categorias> datos;
  final int cantidadcategorias;
  final List<int> cantidadproductos;

  BlockState(this.datos, this.cantidadcategorias, this.cantidadproductos);
}

class BlockInitial extends BlockState {
  BlockInitial() : super(lista, lista.length, []);
}

class BlocDatos extends BlockState {
  final cantidadcategorias;
  final cantidadproductos;

  BlocDatos(this.cantidadcategorias, this.cantidadproductos)
      : super(lista, cantidadcategorias, cantidadproductos);
}
