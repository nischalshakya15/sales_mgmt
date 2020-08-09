import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_request.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_response.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/user.dart';

class AuthenticationDao {
  final Dio _dio = Dio();

  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    final response = await _dio.post(
        'https://spring-authentication-module.herokuapp.com/api/auth/authenticate',
        data: json.encode(authenticationRequest));
    Map<String, dynamic> authenticationResponse = response.data;
    return AuthenticationResponse.fromJson(authenticationResponse);
  }

  Future<User> authorize(String accessToken) async {
    _dio.options.headers['Authorization'] = accessToken;
    final response = await _dio.post(
        'https://spring-authentication-module.herokuapp.com/api/auth/authorize');
    Map<String, dynamic> user = response.data;
    return User.fromJson(user);
  }
}
