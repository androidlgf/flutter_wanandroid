import 'bloc_index.dart';

abstract class BlocBase<V extends BlocEvent, T extends BlocState>
    extends Bloc<BlocEvent, BlocState> {
  @override
  get initialState => BlocInitial();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event);
}
