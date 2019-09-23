class BuildUrlParams {
  static String buildUrlWithParams(String url, Map<String, dynamic> params) {
    if (params == null) {
      return url;
    }
    StringBuffer sb = new StringBuffer(url);
    if (!url.contains("?")) {
      sb.write("?");
    }
    params.forEach((k, v) {
      if (v != null) {
        sb.write(k.toString());
        sb.write('=');
        sb.write(v.toString());
        sb.write("&");
      }
    });
    String buildUrl = sb.toString();
    return buildUrl.endsWith('&')
        ? buildUrl.substring(0, buildUrl.length - 1)
        : sb.toString();
  }

  static String buildUrlJoin(String url, Map<String, dynamic> params) {
    if (params == null) {
      return url;
    }
    StringBuffer sb = new StringBuffer(url);
    params.forEach((k, v) {
      if (v != null) {
        sb.write(k.toString());
        sb.write('/');
        sb.write(v.toString());
        sb.write("&");
      }
    });
    return null;
  }
}
