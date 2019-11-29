import 'package:flutter_common/common/http/http_extra_plugin.dart';

const String HTTP_TAG_STATUS = "status";

class IBrandHttpStatusPlugin extends HttpExtraPlugin {
  @override
  bool isSuccess() {
    dynamic responseResult = getResponseResult();
    if (responseResult == null) {
      return false;
    }
    return responseResult[HTTP_TAG_STATUS];
  }
}
