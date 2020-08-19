import 'package:flutter/material.dart';
import 'package:sales_mgmt/salesmgmt.dart';

import 'org/personal/salemgmt/utils/env_util.dart';

Map<String, String> env;

void main() async {
  env = await loadEnvFile("assets/env/.env_dev");
  runApp(SalesMgmt());
}
