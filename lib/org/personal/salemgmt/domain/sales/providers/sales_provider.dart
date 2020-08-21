import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/repository/sales_repository.dart';

class SalesProvider extends ChangeNotifier {
  final SalesDao salesDao = SalesDao();

  List<Sales> _sales;

  List<Sales> get getSales => _sales;

  Future<List<Sales>> findAll() async {
    _sales = await salesDao.findAll();
    notifyListeners();
    return _sales;
  }

  Future<Sales> save(Sales sale) async {
    final response = await salesDao.save(sale);
    return response;
  }

  Future<Sales> update(Sales sale) async {
    final response = await salesDao.update(sale);
    return response;
  }

  Future<void> remove(String goodsId) async {
    await salesDao.remove(goodsId);
  }
}
