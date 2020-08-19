import 'package:flutter/material.dart';
import 'package:sales_mgmt/salesmgmt.dart';

void main() => runApp(SalesMgmt(
      authenticationBaseUrl:
          "https://spring-authentication-module.herokuapp.com/api",
      authorizationBaseUrl:
          "https://spring-authorization-module.herokuapp.com/api",
    ));
