import 'package:flutter/material.dart';
import 'package:sales_mgmt/main.dart';

class SaleUI extends StatefulWidget {
  _SaleUiState createState() => _SaleUiState();
}

class _SaleUiState extends State<SaleUI> {
  String accessToken;

  Future<String> getAccessToken() async {
    this.accessToken = await storage.read(key: 'accessToken');
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
