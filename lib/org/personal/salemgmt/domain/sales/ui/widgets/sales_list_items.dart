import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/providers/sales_provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/screens/sales_form.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/screens/sales_items_details.dart';

import '../../model/sales.dart';

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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SalesForm(
                                  sale: sale,
                                  title: "Update ${sale.goodsId}",
                                  actionText: "Update",
                                )));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.redAccent,
                  onPressed: () async {
                    await Provider.of<SalesProvider>(context, listen: false)
                        .remove(sale.goodsId);
                  },
                )
              ],
            )));
  }
}
