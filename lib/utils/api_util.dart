import 'dart:convert';

import 'package:dio/dio.dart';

class Resp {
  String code;
  Map<String, dynamic> data;
  String msg;

  Resp(this.code, this.data, this.msg);

  Resp.formJson(Map<String, dynamic> json)
      : code = json['code'],
        data = json['data'],
        msg = json['msg'];
}

class ApiClient {
  static Future<Resp> get(String path, {Map<String, String>? pathVariable,
    Map<String, dynamic>? query}) async {
    String url = "http://127.0.0.1:4523/mock/2137957$path";
    if (pathVariable != null) {
      pathVariable.forEach((key, value) {
        url = url.replaceAll(":$key", value);
      });
    }

    var resp = await Dio().get(url, queryParameters: query);
    if (resp.statusCode != 200) {
      return Resp("50${resp.statusCode}", {}, "http请求错误");
    }
    return Resp.formJson(resp.data);
  }
}
