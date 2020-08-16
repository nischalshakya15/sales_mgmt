import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/sales_service.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/sales_form.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/sales_list.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/ui_utils.dart';

class SaleUI extends StatefulWidget {
  _SaleUiState createState() => _SaleUiState();
}

class _SaleUiState extends State<SaleUI> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _findAll();
  }

  Future<void> _findAll() async {
    try {
      await Provider.of<SalesService>(context, listen: false).findAll();
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
      body: Container(
          child: FutureBuilder(
              future: _findAll(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return Container(
                      child: Consumer<SalesService>(
                    builder: (context, sales, child) =>
                        SalesList(sales: sales.getSales, snapshot: snapshot),
                  ));
                }
              })),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SalesForm(sale: Sales())));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlue),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
