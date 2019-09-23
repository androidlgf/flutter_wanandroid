//网络请求业务状态拦截插件
abstract class HttpExtraPlugin {
  dynamic mResponseResult;

  //判断业务请求是否正确的逻辑
  bool isSuccess();

  void setResponseResult(response) {
    this.mResponseResult = response;
  }

  //获取Http Response
  dynamic getResponseResult() {
    return this.mResponseResult;
  }
}
