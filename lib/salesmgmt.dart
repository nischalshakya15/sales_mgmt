import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sales_mgmt/org/personal/salemgmt/interceptors/app_interceptors.dart';
import 'package:sales_mgmt/org/personal/salemgmt/login/login.dart';

final storage = FlutterSecureStorage();

class SalesMgmt extends StatelessWidget {
  final String authenticationBaseUrl;

  final String authorizationBaseUrl;

  SalesMgmt({this.authenticationBaseUrl, this.authorizationBaseUrl});

  Dio getAuthorizationDio() {
    Dio authorizationDio = Dio(BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        baseUrl: authorizationBaseUrl));
    authorizationDio.interceptors.add(AppInterceptors());
    return authorizationDio;
  }

  Dio getAuthenticationDio() {
    Dio authenticationDio = Dio(BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        baseUrl: authenticationBaseUrl));

    return authenticationDio;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sales Management',
        debugShowCheckedModeBanner: false,
        home: Login());
  }
}
