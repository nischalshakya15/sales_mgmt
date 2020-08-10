import 'package:dio/dio.dart';
import 'package:sales_mgmt/main.dart';

class AppInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    final String accessToken = await storage.read(key: 'accessToken');
    options.headers.addAll({"Authorization": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWF0IjoxNTk3MTY3MDc3LCJleHAiOjE1OTcxNjcwNzd9.Nv-AiH8Bc0UIPFF_1L4YkyVKMQjBr1bmO5n3qxPQGMOGlEtB_88u399rlts-swroJEcprmuqeo1ahN_gNpsUTQ"});
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
