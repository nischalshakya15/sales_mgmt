import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/authentication_dao.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_request.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_response.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/user.dart';

class AuthService {
  final AuthenticationDao authenticationDao = AuthenticationDao();

  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) async {
    return await authenticationDao.authenticate(authenticationRequest);
  }

  Future<User> authorize(String accessToken) async {
    return await authenticationDao.authorize(accessToken);
  }
}
