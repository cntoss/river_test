import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_test/api/impl/api_impl.dart';
import 'package:river_test/model/product_model.dart';

// Creating state notifier provider
final productsProvider =
    StateNotifierProvider<ProductProvider, List<ProductModel>>(
        (ref) => ProductProvider());

// Creating Notifier
class ProductProvider extends StateNotifier<List<ProductModel>> {
  // Notifier constructor - call functions on provider initialization
  ProductProvider() : super([]);

  // Simple loadMovies functions that will load json file from data folder
  loadProducts() async {
    try {
      final moviesList = await ApiRepositoryImpl().fetchProducts();
      state = moviesList;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
