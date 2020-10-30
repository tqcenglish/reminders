import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reminders/api/search.dart';
import 'package:reminders/model/task.dart';

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

mockTasks() {
  return [
    Task(
      name: 'Today',
      iconPath: 'today.png',
      count: 2,
      selected: true,
      activeColor: Colors.blue[700],
    ),
    Task(
      name: 'Today',
      iconPath: 'today.png',
      count: 2,
      selected: true,
      activeColor: Colors.blue[700],
    ),
    Task(
      name: 'Today',
      iconPath: 'today.png',
      count: 2,
      selected: true,
      activeColor: Colors.blue[700],
    ),
  ];
}

// 设备列表
Future<TaskResult> searchTasks() async {
  var res = await dio.request(
    "/plugin-coopaging/device?limit=1000&page=1",
    options: Options(method: "GET"),
  );
  return await compute(TaskResult.fromJson, res.data as Map<String, dynamic>);
}
