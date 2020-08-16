import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/sales_items_details.dart';

import '../model/sales.dart';

class SalesListItems extends StatelessWidget {
  final Sales sale;

  SalesListItems({this.sale});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SalesItemsDetails(sale: sale)));
            },
            leading: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(sale.goodsId[0]),
            ),
            title: Text(sale.goodsId),
            subtitle: Text(sale.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.blueAccent,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.redAccent,
                  onPressed: () {},
                )
              ],
            )));
  }
}
