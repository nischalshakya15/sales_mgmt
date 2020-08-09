import 'package:sales_mgmt/main.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';

class SalesDao {
  Future<List<Sales>> findAll() async {
    authenticationDio.options.headers['Authorization'] =
        await storage.read(key: 'accessToken');
    final response = await authorizationDio.post('/sales');
    print(response);
    List<dynamic> sales = response.data as List;
    List<Sales> s = sales.map((sale) => Sales.fromJson(sale)).toList();
    print(s);
    return sales.map((sale) => Sales.fromJson(sale)).toList();
  }
}
