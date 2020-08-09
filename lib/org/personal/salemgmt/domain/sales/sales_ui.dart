import 'package:flutter/material.dart';
import 'package:sales_mgmt/main.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/sales_dao.dart';

class SaleUI extends StatefulWidget {
  _SaleUiState createState() => _SaleUiState();
}

class _SaleUiState extends State<SaleUI> {
  String accessToken;

  final SalesDao salesDao = SalesDao();

  Future<String> getAccessToken() async {
    this.accessToken = await storage.read(key: 'accessToken');
    try {
      final response = await salesDao.findAll();
      print(response.toString());
    } catch (error) {
      print(error);
    }
    return this.accessToken;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SalesManagement')),
        body: Center(
            child: FutureBuilder(
          future: getAccessToken(),
          builder: (context, snapshot) => snapshot.hasData
              ? Text("$accessToken")
              : snapshot.hasError
                  ? Text("An error occurred")
                  : CircularProgressIndicator(),
        )));
  }
}
