import 'package:flutter_common/common/utils/device_util.dart';

const String VERSION = 'version';
const String USER_AGENT = 'user-agent';
const String IP = 'ip';
const String NETWORK = 'network';
const String LANGUAGE = 'lang';
const String ENCODING = 'Accept-Encoding';

///Http DefaultHeader
class HttpDefaultHeaders {
  Future<Map<String, dynamic>> buildDefaultHeaders() async {
    Map<String, dynamic> defaultHeaderMap = new Map();

    defaultHeaderMap.putIfAbsent(VERSION, () => '1.0.0');

    var userAgent = await DeviceUtil.getUserAgent();
    defaultHeaderMap.putIfAbsent(USER_AGENT, () => userAgent);

    var localIPAddress = await DeviceUtil.getLocalIPAddress();
    defaultHeaderMap.putIfAbsent(IP, () => localIPAddress);

    var language = await DeviceUtil.getLanguage();
    defaultHeaderMap.putIfAbsent(LANGUAGE, () => language);

    defaultHeaderMap.putIfAbsent(NETWORK, () => '1.0.0');

    defaultHeaderMap.putIfAbsent(ENCODING, () => '*');

    return defaultHeaderMap;
  }
}
