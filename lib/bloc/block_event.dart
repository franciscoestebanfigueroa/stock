part of 'block_bloc.dart';

@immutable
abstract class BlockEvent {}

class ETabs extends BlockEvent {
  final int cproductos;
  final int index;

  ETabs(this.cproductos, this.index);
}

class EScroller extends BlockEvent {
  final double to;
  final double from;
  final int index;
  EScroller({required this.index, required this.to, required this.from});
}
