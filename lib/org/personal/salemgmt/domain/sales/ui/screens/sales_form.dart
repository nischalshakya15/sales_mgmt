import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/providers/sales_provider.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/ui/sales_ui.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/ui_utils.dart';

class SalesForm extends StatefulWidget {
  final Sales sale;
  final String actionText;
  final String title;

  SalesForm({this.sale, this.actionText, this.title});

  @override
  _SalesForm createState() => _SalesForm();
}

class _SalesForm extends State<SalesForm> {
  final GlobalKey<FormState> _salesForm = GlobalKey<FormState>();

  final globalKey = GlobalKey<ScaffoldState>();

  void _submitForm() async {
    final FormState form = _salesForm.currentState;

    if (!form.validate()) {
      UiUtils.showSnackBar(globalKey, "Form is not valid", Colors.redAccent);
    } else {
      form.save();
      if (widget.actionText == "Save") {
        await _save(widget.sale);
      } else {
        await _update(widget.sale);
      }
      Navigator.pop(context, MaterialPageRoute(builder: (context) => SaleUI()));
    }
  }

  Future<void> _save(Sales sale) async {
    try {
      await getSalesProvider().save(sale);
    } catch (error) {
      UiUtils.showSnackBar(
          globalKey, error.response.data['message'], Colors.red);
    }
  }

  Future<void> _update(Sales sale) async {
    try {
      await getSalesProvider().update(sale);
    } catch (error) {
      UiUtils.showSnackBar(
          globalKey, error.response.data['message'], Colors.red);
      throw error;
    }
  }

  SalesProvider getSalesProvider() {
    return Provider.of<SalesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Sales sale = widget.sale;
    return Scaffold(
      key: globalKey,
      appBar: AppBar(title: Text("${widget.title}")),
      body: Form(
        key: _salesForm,
        autovalidate: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
          children: <Widget>[
            goodsIdTextFormField(
                sale.goodsId != null ? sale.goodsId.toString() : ""),
            goodsDescriptionTextFormField(
                sale.description != null ? sale.description.toString() : ""),
            pricePerUnitTextFormField(
                sale.pricePerUnit != null ? sale.pricePerUnit.toString() : ""),
            quantityTextFormField(
                sale.quantity != null ? sale.quantity.toString() : ""),
            totalSalesTextFormField(
                sale.totalSales != null ? sale.totalSales.toString() : ""),
            submitFlatButton("${widget.actionText}")
          ],
        ),
      ),
    );
  }

  Container submitFlatButton(String actionText) {
    return Container(
        padding: EdgeInsets.only(left: 10.0, top: 20.0),
        child: FlatButton(
          color: Colors.blueAccent,
          padding: EdgeInsets.all(8.0),
          textColor: Colors.white,
          child: Text(actionText),
          onPressed: _submitForm,
        ));
  }

  TextFormField totalSalesTextFormField(String totalSales) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.tab), hintText: "Total", labelText: "Total"),
        initialValue: totalSales,
        validator: (val) => val.isEmpty ? "Total is required" : null,
        onSaved: (val) => widget.sale.totalSales = double.parse(val.trim()));
  }

  TextFormField quantityTextFormField(String quantity) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.local_grocery_store),
            hintText: "Enter quantity",
            labelText: "Quantity"),
        initialValue: quantity,
        validator: (val) => val.isEmpty ? "Quantity is required" : null,
        onSaved: (val) => widget.sale.quantity = int.parse(val.trim()));
  }

  TextFormField pricePerUnitTextFormField(String pricePerUnit) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.attach_money),
            hintText: "Enter price per unit",
            labelText: "Price per unit"),
        initialValue: pricePerUnit,
        validator: (val) => val.isEmpty ? "Price per unit is required" : null,
        onSaved: (val) => widget.sale.pricePerUnit = double.parse(val.trim()));
  }

  TextFormField goodsDescriptionTextFormField(String description) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.description),
            hintText: "Enter description",
            labelText: "Goods Description"),
        initialValue: description,
        validator: (val) => val.isEmpty ? "Description is required" : null,
        onSaved: (val) => widget.sale.description = val.trim());
  }

  TextFormField goodsIdTextFormField(String goodsId) {
    return TextFormField(
        decoration: InputDecoration(
            icon: Icon(Icons.vpn_key),
            hintText: "Enter goods Id",
            labelText: "Goods ID"),
        initialValue: goodsId,
        validator: (val) => val.isEmpty ? "Goods Id is required" : null,
        onSaved: (val) => widget.sale.goodsId = val.trim());
  }
}
