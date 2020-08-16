import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/providers/sales_provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/sales_ui.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/ui_utils.dart';

class SalesForm extends StatefulWidget {
  final Sales sale;

  SalesForm({this.sale});

  @override
  _SalesForm createState() => _SalesForm();
}

class _SalesForm extends State<SalesForm> {
  final GlobalKey<FormState> _salesForm = GlobalKey<FormState>();

  final globalKey = GlobalKey<ScaffoldState>();

  final SalesProvider salesService = SalesProvider();

  void _submitForm() async {
    final FormState form = _salesForm.currentState;

    if (!form.validate()) {
      UiUtils.showSnackBar(globalKey, "Form is not valid", Colors.redAccent);
    } else {
      form.save();
      await _save(widget.sale);
      print('Goods id ${widget.sale.toString()}');
      Navigator.pop(context, MaterialPageRoute(builder: (context) => SaleUI()));
    }
  }

  Future<void> _save(Sales sale) async {
    await Provider.of<SalesProvider>(context, listen: false).save(sale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(title: Text("Create new Sales")),
      body: Form(
        key: _salesForm,
        autovalidate: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
          children: <Widget>[
            goodsIdTextFormField(),
            goodsDescriptionTextFormField(),
            pricePerUnitTextFormField(),
            quantityTextFormField(),
            totalSalesTextFormField(),
            submitFlatButton()
          ],
        ),
      ),
    );
  }

  Container submitFlatButton() {
    return Container(
        padding: EdgeInsets.only(left: 10.0, top: 20.0),
        child: FlatButton(
          color: Colors.blueAccent,
          padding: EdgeInsets.all(8.0),
          textColor: Colors.white,
          child: Text('Submit'),
          onPressed: _submitForm,
        ));
  }

  TextFormField totalSalesTextFormField() {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.tab), hintText: "Total", labelText: "Total"),
        validator: (val) => val.isEmpty ? 'Total is required' : null,
        onSaved: (val) => widget.sale.totalSales = double.parse(val));
  }

  TextFormField quantityTextFormField() {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.local_grocery_store),
            hintText: "Enter quantity",
            labelText: "Quantity"),
        validator: (val) => val.isEmpty ? 'Quantity is required' : null,
        onSaved: (val) => widget.sale.quantity = int.parse(val));
  }

  TextFormField pricePerUnitTextFormField() {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.attach_money),
            hintText: "Enter price per unit",
            labelText: "Price per unit"),
        validator: (val) => val.isEmpty ? 'Price per unit is required' : null,
        onSaved: (val) => widget.sale.pricePerUnit = double.parse(val));
  }

  TextFormField goodsDescriptionTextFormField() {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.description),
            hintText: "Enter description",
            labelText: "Goods Description"),
        validator: (val) => val.isEmpty ? 'Description is required' : null,
        onSaved: (val) => widget.sale.description = val);
  }

  TextFormField goodsIdTextFormField() {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.vpn_key),
            hintText: "Enter goods Id",
            labelText: "Goods ID"),
        validator: (val) => val.isEmpty ? 'Goods Id is required' : null,
        onSaved: (val) => widget.sale.goodsId = val);
  }
}
