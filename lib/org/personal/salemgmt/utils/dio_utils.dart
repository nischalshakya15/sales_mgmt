import 'package:dio/dio.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/env_util.dart';

final Dio authenticationDio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    baseUrl: env["AUTHENTICATION_URL"]));

final Dio authorizationDio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    baseUrl: env["AUTHORIZATION_URL"]));
