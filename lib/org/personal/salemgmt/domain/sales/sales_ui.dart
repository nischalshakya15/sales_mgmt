import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/sales_dao.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/ui_utils.dart';

class SaleUI extends StatefulWidget {
  _SaleUiState createState() => _SaleUiState();
}

class _SaleUiState extends State<SaleUI> {
  String accessToken = 'Something';

  final SalesDao salesDao = SalesDao();
  final globalKey = GlobalKey<ScaffoldState>();
  List<Sales> sales = List();

  Future<void> findAll() async {
    try {
      final response = await salesDao.findAll();
      setState(() {
        this.sales = response;
      });
    } catch (error) {
      UiUtils.showSnackBar(
          globalKey, error.response.data['message'], Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        appBar: AppBar(title: Text('SalesManagement')),
        body: Center(
            child: FutureBuilder(
          future: findAll(),
          builder: (context, snapshot) => snapshot.hasData
              ? Text("$accessToken")
              : snapshot.hasError
                  ? Text("An error occurred")
                  : CircularProgressIndicator(),
        )));
  }
}
