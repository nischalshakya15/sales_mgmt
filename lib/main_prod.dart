import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/env_util.dart';
import 'package:sales_mgmt/salesmgmt.dart';

void main() async {
  await loadEnvFile("assets/env/.env_prod");
  runApp(SalesMgmt());
}
