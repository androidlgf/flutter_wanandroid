import 'package:flutter_common/common/mvp/mvp_view.dart';

abstract class IPresenter<V extends MvpView> {
  //插入到渲染树时调用，只执行一次。（类似Android Fragment的onCreateView函数）/
  void initState(V view);

  //在初始化initState后执行； 2、显示/关闭其它widget。 3、可执行多次；/
  void didChangeDependencies();

  //有点像Android的onStop函数， 在打开新的Widget或回到这个widget时会执行； 可执行多次；/
  void deactivate();

  //类似于Android的onDestroy， 在执行Navigator.pop后会调用该办法， 表示组件已销毁；/
  void dispose();

  //点击闪电会执行，只用于调试时的hot reload。 release版本不会执行该函数。/
  void reassemble();
}
