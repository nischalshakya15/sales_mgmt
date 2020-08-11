import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/sales_items_details.dart';

import 'model/sales.dart';

class SalesItems extends StatelessWidget {
  final Sales sale;

  SalesItems({this.sale});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SalesItemsDetails(sale: sale)));
        },
        leading: CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(sale.goodsId[0]),
        ),
        title: Text(sale.goodsId),
        subtitle: Text(sale.description));
  }
}
