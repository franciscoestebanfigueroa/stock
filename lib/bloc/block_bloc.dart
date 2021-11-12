import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock/datos.dart';
import 'package:stock/model.dart';

part 'block_event.dart';
part 'block_state.dart';

class BlockBloc extends Bloc<BlockEvent, BlockState> {
  BlockBloc() : super(BlockInitial()) {
    on<BlockEvent>((event, emit) {
      if (event is ETabs) {
        state.datos[event.index].cantidadproductos = event.cproductos;
        for (var item in state.datos) {
          print(item.cantidadproductos);
        }
        emit(BlockInitial());
      } else {
        emit(BlockInitial());
      }
    });
  }
}
