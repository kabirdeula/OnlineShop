import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:online_shop/core/services/services.dart';
import 'package:online_shop/features/product/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await rootBundle.loadString('data/product.json');
      final List data = json.decode(response);
      return data.map((product) => Product.fromJson(product)).toList();
    } catch (e) {
      log.e("(Product Service) Error fetching products: $e");
      return [];
    }
  }
}
