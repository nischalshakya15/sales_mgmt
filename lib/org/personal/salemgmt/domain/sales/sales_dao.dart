import 'package:sales_mgmt/main.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';

class SalesDao {
  Future<List<Sales>> findAll() async {
    final response = await authorizationDio.get('/sales');
    List<dynamic> sales = response.data as List;
    return sales.map((sale) => Sales.fromJson(sale)).toList();
  }
}
