import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/sales_list_items.dart';

class SalesList extends StatelessWidget {
  final List<Sales> sales;

  SalesList({@required this.sales});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks() {
    return sales.map((sale) => SalesListItems(sale: sale)).toList();
  }
}
