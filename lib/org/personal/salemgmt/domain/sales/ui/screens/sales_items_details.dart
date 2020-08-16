import 'package:flutter/material.dart';

import '../../model/sales.dart';

class SalesItemsDetails extends StatelessWidget {
  final Sales sale;

  SalesItemsDetails({this.sale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sale.goodsId),
      ),
      body: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(30, 40, 0, 10),
          child: Text(sale.description)),
    );
  }
}
