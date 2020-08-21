import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/authentication_repository.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_request.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_response.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/user.dart';
import 'package:sales_mgmt/salesmgmt.dart';

class AuthenticationService {
  final AuthenticationDao authenticationDao = AuthenticationDao();

  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    AuthenticationResponse authenticationResponse =
        await authenticationDao.authenticate(authenticationRequest);

    await setAccessTokenAndRefreshToken(authenticationResponse);

    return authenticationResponse;
  }

  Future<User> authorize(String accessToken) async {
    return await authenticationDao.authorize(accessToken);
  }

  Future<void> setAccessTokenAndRefreshToken(
      AuthenticationResponse authenticationResponse) async {
    await storage.write(
        key: 'accessToken', value: authenticationResponse.accessToken);
    await storage.write(
        key: 'refreshToken', value: authenticationResponse.refreshToken);
  }
}
