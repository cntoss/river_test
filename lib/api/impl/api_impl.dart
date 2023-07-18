import 'package:dio/dio.dart';
import 'package:river_test/api/source/api_source.dart';
import 'package:river_test/model/product_model.dart';

import '../repository/api_repository.dart';

class ApiRepositoryImpl extends ApiRepository {
  final ApiSource apiSource = ApiSource();
  @override
  Future<List<ProductModel>> fetchProducts() async {
    Response response = await apiSource.getRequest();
    return productModelFromJson(response.data);
  }

  @override
  Future<String?> login({String? username, String? password}) async {
    Response response = await apiSource.postRequest(body: {
      'username': username ?? "mor_2314",
      'password': password ?? "83r5^_"
    });
    return response.data['token'];
  }
}
