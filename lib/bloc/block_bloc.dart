import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'block_event.dart';
part 'block_state.dart';

class BlockBloc extends Bloc<BlockEvent, BlockState> {
  BlockBloc() : super(BlockInitial('hola mundo')) {
    on<BlockEvent>((event, emit) {
      BlockInitial('Pancho');
    });
  }
}
