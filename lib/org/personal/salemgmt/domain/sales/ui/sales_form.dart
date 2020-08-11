import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';

class SalesForm extends StatefulWidget {
  final Sales sale;

  SalesForm({this.sale});

  @override
  _SalesForm createState() => _SalesForm();
}

class _SalesForm extends State<SalesForm> {
  final GlobalKey<FormState> _salesForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create new Sales")),
      body: Form(
        key: _salesForm,
        child: ListView(
          padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    hintText: "Enter goods Id",
                    labelText: "Goods ID")),
            TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.description),
                    hintText: "Enter description",
                    labelText: "Goods Description")),
            TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_money),
                    hintText: "Enter price per unit",
                    labelText: "Price per unit")),
            TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.local_grocery_store),
                    hintText: "Enter quantity",
                    labelText: "Quantity")),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.tab), hintText: "Total", labelText: "Total"),
              enabled: false,
            ),
            FlatButton(
              color: Colors.blueAccent,
              padding: EdgeInsets.all(8.0),
              textColor: Colors.white,
              child: Text('Submit'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
