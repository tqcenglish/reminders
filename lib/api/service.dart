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
Future<SongResult> searchSongs(id) async {
  String url = "http://localhost:3000/playlist/detail?id=$id";
  print("get $url");

  try {
    var res = await dio.request(
      url,
      options: Options(method: "GET"),
    );

  return await compute(
      SongResult.fromJson,  res.data as Map<String, dynamic>);
  } catch (e) {
    print(e.message);
  }
  return null;
}

// 获取歌曲连接
Future<String> getSongUrl(id) async {
  String url = "http://localhost:3000/song/url?id=$id";
  print('get $url');
  try {
    Response res = await dio.request(
      url,
      options: Options(method: "GET"),
    );
    var data =res.data as Map<String, dynamic>;
    return data["data"][0]["url"];
  } catch (e) {
    print(e.message);
    return "";
  }
}
