part of 'block_bloc.dart';

@immutable
abstract class BlockEvent {}

class ETabs extends BlockEvent {
  final int cproductos;
  final int index;

  ETabs(this.cproductos, this.index);
}

class EScroller extends BlockEvent {
  final to;
  final from;
  final index;
  EScroller({this.index, this.to, this.from});
}
