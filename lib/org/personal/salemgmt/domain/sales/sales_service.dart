import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/model/sales.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales/sales_dao.dart';

class SalesService {
  final SalesDao salesDao = SalesDao();

  Future<List<Sales>> findAll() async {
    final response = await salesDao.findAll();
    return response;
  }
}
