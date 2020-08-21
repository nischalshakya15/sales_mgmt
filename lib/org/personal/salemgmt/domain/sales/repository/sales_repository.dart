import 'dart:convert';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/dio_utils.dart';

class SalesDao {
  Future<List<Sales>> findAll() async {
    final response = await authorizationDio.get('/sales');
    List<dynamic> sales = response.data as List;
    return sales.map((sale) => Sales.fromJson(sale)).toList();
  }

  Future<Sales> save(Sales sale) async {
    final response =
        await authorizationDio.post('/sales', data: json.encode(sale));
    return Sales.fromJson(response.data);
  }

  Future<Sales> update(Sales sale) async {
    final response = await authorizationDio.put('/sales/${sale.goodsId}',
        data: json.encode(sale));
    return Sales.fromJson(response.data);
  }

  Future<void> remove(String goodsId) async {
    await authorizationDio.delete("/sales/$goodsId");
  }
}
