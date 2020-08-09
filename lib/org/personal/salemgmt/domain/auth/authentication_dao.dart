import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_request.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_response.dart';

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
}
