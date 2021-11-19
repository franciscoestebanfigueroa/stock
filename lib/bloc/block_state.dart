part of 'block_bloc.dart';

@immutable
abstract class BlockState {
  final double alturaproductos = 40;
  final double alturacategorias = 50;
  final double alturatab = 50;
  List<Categorias> datos;

  BlockState(this.datos);
}

class BlockInitial extends BlockState {
  final lista;
  BlockInitial(this.lista) : super(lista);
}
