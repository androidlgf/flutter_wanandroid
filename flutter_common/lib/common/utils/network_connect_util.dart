import 'package:connectivity/connectivity.dart';

//网络状态相关/
class NetworkConnectUtil {
  static Future<bool> isNetworkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
