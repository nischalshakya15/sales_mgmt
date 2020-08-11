import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/sales_dao.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/sales_items.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/ui_utils.dart';

class SaleUI extends StatefulWidget {
  _SaleUiState createState() => _SaleUiState();
}

class _SaleUiState extends State<SaleUI> {
  final SalesDao salesDao = SalesDao();
  final globalKey = GlobalKey<ScaffoldState>();

  List<Sales> sales = List();

  Future<List<Sales>> _findAll() async {
    try {
      this.sales = await salesDao.findAll();
    } catch (error) {
      UiUtils.showSnackBar(
          globalKey, error.response.data['message'], Colors.red);
    }
    return sales;
  }

  ListView _buildSaleListView(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          Sales sale = snapshot.data[index];
          return SalesItems(sale: sale);
        });
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
                    return _buildSaleListView(snapshot);
                  }
                })));
  }
}
