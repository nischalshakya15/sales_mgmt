import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/providers/sales_provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/sales_ui.dart';

class SalesModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: SalesProvider()),
          FutureProvider.value(value: SalesProvider().findAll())
        ],
        child: MaterialApp(
            title: 'Sales Management',
            debugShowCheckedModeBanner: false,
            home: SaleUI()));
  }
}
