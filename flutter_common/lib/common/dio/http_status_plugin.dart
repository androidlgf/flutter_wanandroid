import 'package:flutter_common/common/http/http_extra_plugin.dart';

const String HTTP_TAG_STATUS = "status";

class HttpStatusPlugin extends HttpExtraPlugin {
  @override
  bool isSuccess() {
    dynamic responseResult = getResponseResult();
    if (responseResult == null) {
      return false;
    }
    int status = responseResult[HTTP_TAG_STATUS];
    return status == 0;
  }
}