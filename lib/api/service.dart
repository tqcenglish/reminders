import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reminders/api/array.dart';
import 'package:reminders/api/common.dart';
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

// 获取列表
Future<SongGroupModelResult> searchGroups() async {
  print('searchGroups');
  var res = await dio.request(
    kugoListInfoUrl,
    options: Options(method: "GET"),
  );
  print(res);
  var data = String.fromCharCodes(new Runes(res.data));
  return await compute(
      SongGroupModelResult.fromJson, jsonDecode(data) as Map<String, dynamic>);
}

// 获取列表
Future<SongModelResult> searchSongs() async {
  print('searchSongs');
  var res = await dio.request(
    kuogoList,
    options: Options(method: "GET"),
  );
  print(res);
  var data = String.fromCharCodes(new Runes(res.data));
  RegExp reg = new RegExp(r"global\.data = (\[.+\]);");
  Iterable<Match> matches = reg.allMatches(data);
  for (Match m in matches) {
    data = m.group(1);
  }
  print(data);
  return await compute(
      SongModelResult.fromJson, jsonDecode(data) as List<dynamic>);
}
