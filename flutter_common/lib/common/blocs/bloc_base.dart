import 'bloc_index.dart';

abstract class BlocBase<V extends BlocEvent, T extends BlocState>
    extends Bloc<BlocEvent, BlocState> {
  @override
  get initialState => BlocInitial();

  //对于State生命周期
  void dispose();

  //对于State生命周期
  void initState();

  //对于State生命周期
  void didChangeDependencies();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event);  
}
