import 'package:flutter_common/common/http/http_extra_plugin.dart';

const String HTTP_TAG_STATUS = "code";

class LifeHttpStatusPlugin extends HttpExtraPlugin {
  @override
  bool isSuccess() {
    dynamic responseResult = getResponseResult();
    if (responseResult == null) {
      return false;
    }
    return responseResult[HTTP_TAG_STATUS] == '0';
  }
}
