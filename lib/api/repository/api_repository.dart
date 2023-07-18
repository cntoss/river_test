import 'package:river_test/model/product_model.dart';

abstract class ApiRepository {
  Future<List<ProductModel>> fetchProducts();
  Future<String?> login({String? username, String? password});
}
