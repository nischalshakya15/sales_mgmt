import 'package:flutter/material.dart';
import 'package:sales_mgmt/main.dart';

class SaleUI extends StatefulWidget {
  _SaleUiState createState() => _SaleUiState();
}

class _SaleUiState extends State<SaleUI> {
  String accessToken;
  String something;

  getAccessToken() async {
    accessToken = await storage.read(key: 'accessToken');
    something = await storage.read(key: 'something');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SalesManagement')),
      body: Center(
          child: FutureBuilder(
              future: getAccessToken(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Text("$something")
                  : snapshot.hasError
                      ? Text("An error occurred")
                      : CircularProgressIndicator())),
    );
  }
}
