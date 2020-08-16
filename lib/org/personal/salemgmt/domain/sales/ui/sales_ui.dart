import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/sales_service.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/sales_form.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/sales_list.dart';

class SaleUI extends StatefulWidget {
  _SaleUiState createState() => _SaleUiState();
}

class _SaleUiState extends State<SaleUI> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Provider.of<SalesService>(context, listen: false).findAll();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<SalesService>(context, listen: false).findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(title: Text('SalesManagement')),
      body: Container(
          child: Consumer<SalesService>(
        builder: (context, sales, child) => SalesList(sales: sales.sales),
      )),
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
