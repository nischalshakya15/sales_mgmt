import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sales_mgmt/org/personal/salemgmt/login/login.dart';

final storage = FlutterSecureStorage();

class SalesMgmt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sales Management',
        debugShowCheckedModeBanner: false,
        home: Login());
  }
}
