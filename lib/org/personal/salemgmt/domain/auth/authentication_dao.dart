import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_request.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_response.dart';

class AuthenticationDao {
  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    final response = await http.post(
        'https://spring-authentication-module.herokuapp.com/api/auth/authenticate',
        headers: {'Content-Type': 'application/json'},
        body: json.encode(authenticationRequest));

    Map<String, dynamic> authenticationResponse = json.decode(response.body);
    return AuthenticationResponse.fromJson(authenticationResponse);
  }
}
