part of 'block_bloc.dart';

@immutable
abstract class BlockState {
  final nombre;

  BlockState(this.nombre);
}

class BlockInitial extends BlockState {
  final String nombre;

  BlockInitial(this.nombre) : super(nombre);
}
