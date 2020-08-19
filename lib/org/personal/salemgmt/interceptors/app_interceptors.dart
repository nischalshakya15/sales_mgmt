import 'package:dio/dio.dart';
import 'package:sales_mgmt/salesmgmt.dart';

class AppInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    final String accessToken = await storage.read(key: 'accessToken');
    options.headers.addAll({"Authorization": accessToken});
    return options;
  }

  @override
  Future onError(DioError err) {
    // TODO: implement onError
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    // TODO: implement onResponse
    return super.onResponse(response);
  }
}
