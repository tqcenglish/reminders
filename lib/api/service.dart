import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reminders/api/search.dart';

Dio dio = Dio();

void disableHttpsDio() {
  //FIX 忽略错误证书认证
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  };
}

void initDio(String baseUrl, String token) {
  // 或者通过传递一个 `options`来创建dio实例
  final headers = new Map<String, dynamic>();
  headers['Authorization'] = "Bearer $token";
  BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: headers,
  );
  dio.options = options;
}

// 歌曲列表
// 93 17 16 15
Future<SongResult> searchSongs(id) async {
  String url = "http://kbangserver.kuwo.cn/ksong.s?from=pc&fmt=json&pn=0&rn=100&type=bang&data=content&id=$id&show_copyright_off=0&pcmp4=1&isbang=1";
  print("get $url");
  var res = await dio.request(
    url,
    options: Options(method: "GET"),
  );
  // print(res.data);

  return await compute(
      SongResult.fromJson, jsonDecode(res.data) as Map<String, dynamic>);
}

// 获取歌曲连接
Future<String> getSongUrl(id) async {
  String url = "http://tm.tempmusic.tk/url/kw/$id/128k";
  print('get $url');
  try {
    Response res = await dio.request(
      url,
      options: Options(method: "GET"),
    );
    var data = jsonDecode(res.data) as Map<String, String>;
    return data["data"];
  } catch (e) {
    print(e.message);
    return "";
  }
}
