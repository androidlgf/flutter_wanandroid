const String VERSION = 'version';
const String USER_AGENT = 'user-agent';
const String IP = 'ip';
const String NETWORK = 'network';
const String LANGUAGE = 'lang';
const String ENCODING = 'Accept-Encoding';

///Http DefaultHeader
class HttpDefaultHeaders {
  Map<String, dynamic> buildDefaultHeaders() {
    Map<String, dynamic> defaultHeaderMap = new Map();
    defaultHeaderMap.putIfAbsent(VERSION, () {
      '1.0.0';
    });
    defaultHeaderMap.putIfAbsent(USER_AGENT, () {
      '1.0.0';
    });
    defaultHeaderMap.putIfAbsent(IP, () {
      '1.0.0';
    });
    defaultHeaderMap.putIfAbsent(NETWORK, () {
      '1.0.0';
    });
    defaultHeaderMap.putIfAbsent(LANGUAGE, () {
      '1.0.0';
    });
    defaultHeaderMap.putIfAbsent(ENCODING, () {
      '1.0.0';
    });
    return defaultHeaderMap;
  }
}
