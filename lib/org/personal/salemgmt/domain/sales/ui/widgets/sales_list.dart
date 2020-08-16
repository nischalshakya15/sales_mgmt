import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/widgets/sales_list_items.dart';

class SalesList extends StatelessWidget {
  final List<Sales> sales;

  final AsyncSnapshot snapshot;

  SalesList({@required this.sales, @required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          Sales sale = snapshot.data[index];
          return SalesListItems(sale: sale);
        });
  }
}
