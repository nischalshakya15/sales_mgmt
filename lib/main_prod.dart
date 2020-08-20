import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/interceptors/app_interceptors.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/dio_utils.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/env_util.dart';
import 'package:sales_mgmt/salesmgmt.dart';

void main() async {
  await loadEnvFile("assets/env/.env_prod");
  authorizationDio.interceptors.add(AppInterceptors());
  runApp(SalesMgmt());
}
