import 'package:sales_mgmt/main.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/authentication_dao.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_request.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_response.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/user.dart';

class AuthService {
  final AuthenticationService authenticationDao = AuthenticationService();

  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    AuthenticationResponse authenticationResponse =
        await authenticationDao.authenticate(authenticationRequest);

    storage.write(
        key: 'accessToken', value: authenticationResponse.accessToken);
    storage.write(
        key: 'refreshToken', value: authenticationResponse.refreshToken);

    return authenticationResponse;
  }

  Future<User> authorize(String accessToken) async {
    return await authenticationDao.authorize(accessToken);
  }
}
