import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/authentication_dao.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_request.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/auth/model/authentication_response.dart';

class AuthService {

  final AuthenticationDao authenticationDao = AuthenticationDao();

  Future<AuthenticationResponse> authenticate(
      AuthenticationRequest authenticationRequest) {
    return authenticationDao.authenticate(authenticationRequest);
  }
}
