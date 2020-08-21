import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_request.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_response.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/user.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/dio_utils.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/env_util.dart';

class AuthenticationDao {
  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    print(env);
    final response = await authenticationDio.post('/auth/authenticate',
        options: Options(headers: {"requireToken": false}),
        data: json.encode(authenticationRequest));
    return AuthenticationResponse.fromJson(response.data);
  }

  Future<User> authorize(String accessToken) async {
    authenticationDio.options.headers['Authorization'] = accessToken;
    final response = await authenticationDio.post('/auth/authorize');
    User user = User.fromJson(response.data);
    return user;
  }
}
