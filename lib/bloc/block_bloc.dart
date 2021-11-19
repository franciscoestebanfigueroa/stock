import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:stock/datos.dart';
import 'package:stock/model.dart';

part 'block_event.dart';
part 'block_state.dart';

class BlockBloc extends Bloc<BlockEvent, BlockState> {
  BlockBloc() : super(BlockInitial(lista)) {
    on<BlockEvent>((event, emit) {
      if (event is ETabs) {
        state.datos[event.index].cantidadproductos = event.cproductos;
        print(' cantidad datos${state.datos[event.index].cantidadproductos}');
        emit(BlockInitial(state.datos));
      } else if (event is EScroller) {
        state.datos[event.index].from = event.from;
        // state.datos[event.index].to = event.to;
        emit(BlockInitial(state.datos));
        print(' From ${event.from}');
        print(' TO ${event.to}');
      } else {
        emit(BlockInitial(state.datos));
      }
    });
  }
}
