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
        return BlockInitial();
      }
    });
  }
}
