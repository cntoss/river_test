import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_test/model/product_model.dart';
import 'package:river_test/provider/product_provider.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ProductModel>? products = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: (products ?? []).isEmpty
          ? const Center(
              child: Text('No products found'),
            )
          : ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                return productCard(products[index]);
              }),
    );
  }

  Widget productCard(ProductModel product) {
    return Card(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 150,
              height: 150,
              child: Image.network(product.image ?? '')),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8.0,
              ),
              Text(product.title ?? ""),
              Text("Category: ${product.category ?? ""}"),
              Text(
                "Price ${product.price ?? 0}",
                style: const TextStyle(color: Colors.blueGrey),
              ),
              Text(
                product.description ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
