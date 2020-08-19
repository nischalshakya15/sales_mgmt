import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sales_mgmt/org/personal/salemgmt/interceptors/app_interceptors.dart';
import 'package:sales_mgmt/org/personal/salemgmt/login/login.dart';

final storage = FlutterSecureStorage();

final Dio authenticationDio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    baseUrl: 'https://spring-authentication-module.herokuapp.com/api'));

final Dio authorizationDio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    baseUrl: 'https://spring-authorization-module.herokuapp.com/api'));

void main() {
  authorizationDio.interceptors.add(AppInterceptors());
  runApp(MaterialApp(
      title: 'Sales Management',
      debugShowCheckedModeBanner: false,
      home: Login()));
}
