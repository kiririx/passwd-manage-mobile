import 'dart:convert';

import 'package:dio/dio.dart';

class Resp {
  int code;
  Map<String, dynamic> data;
  String errMsg;

  Resp(this.code, this.data, this.errMsg);

  Resp.formJson(Map<String, dynamic> json)
      : code = json['code'],
        data = json['data'],
        errMsg = json['errMsg'];
} 

class ApiClient {
  static Future<Resp> get(String path, {Map<String, String>? pathVariable,
    Map<String, dynamic>? query}) async {
    String url = "http://101.43.168.250:10011$path";
    if (pathVariable != null) {
      pathVariable.forEach((key, value) {
        url = url.replaceAll(":$key", value);
      });
    }
    var dio = Dio();
    dio.options.headers = {'Authorization':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJraXJpcml4IiwiZXhwIjoxNjgwNjcwMzA4LCJpc3MiOiJhZG1pbiJ9.WcNfTlYnwgSKvE4cC0CBuw-JAMFuh27ABt331eCInl4'};
    var resp = await dio.get(url, queryParameters: query);
    if (resp.statusCode != 200) {
      return Resp(resp.statusCode!, {}, "http请求错误");
    }
    return Resp.formJson(resp.data);
  }
}
