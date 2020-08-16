import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/repository/sales_dao.dart';

class SalesProvider extends ChangeNotifier {
  final SalesDao salesDao = SalesDao();

  List<Sales> _sales = List();

  List<Sales> get getSales => _sales;

  Future<List<Sales>> findAll() async {
    _sales = await salesDao.findAll();
    notifyListeners();
    return _sales;
  }

  Future<void> save(Sales sale) async {
    await salesDao.save(sale);
    findAll();
  }
}
