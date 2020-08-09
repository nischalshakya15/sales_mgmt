import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sales_mgmt/org/personal/salemgmt/login/login.dart';

final storage = FlutterSecureStorage();

void main() {
  runApp(MaterialApp(home: Login()));
}