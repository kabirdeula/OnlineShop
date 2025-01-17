import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:online_shop/features/product/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await rootBundle.loadString('assets/products.json');
      final List data = json.decode(response);
      return data.map((product) => Product.fromJson(product)).toList();
    } catch (e) {
      return [];
    }
  }
}
