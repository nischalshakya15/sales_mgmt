import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/sales_dao.dart';

class SalesService extends ChangeNotifier {
  final SalesDao salesDao = SalesDao();

  List<Sales> _sales = List();

  List<Sales> get sales => _sales;

  Future<void> findAll() async {
    _sales = await salesDao.findAll();
    notifyListeners();
  }

  Future<void> save(Sales sale) async {
    await salesDao.save(sale);
    notifyListeners();
  }
}
