import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/core/services/services.dart';
import 'package:online_shop/core/utils/utils.dart';
import 'package:online_shop/features/product/product.dart';

/// Service class for handling product-related operations.
class ProductService {
  late final Future<Box<Product>> _productBox;

  /// Constructor to initialize the Hive box for products.
  ProductService() {
    _productBox = HiveUtil.openHiveBox<Product>('products');
  }

  /// Fetches products from a JSON file and saves them to Hive.
  /// 
  /// Returns a list of fetched products.
  Future<List<Product>> fetchAndSaveProducts() async {
    try {
      // Load the JSON file
      final response = await rootBundle.loadString('assets/data/product.json');
      final List<dynamic> data = json.decode(response);

      // Parse JSON data into Product objects
      final products = data.map((json) => Product.fromJson(json)).toList();

      // Save products to Hive
      final box = await _productBox;
      for (final product in products) {
        await box.put(product.id, product);
      }

      log.i("(ProductService) Fetched and saved ${products.length} products to Hive.");
      return products;
    } catch (e) {
      log.e("(ProductService) Error fetching and saving products: $e");
      return [];
    }
  }

  /// Fetches all saved products from Hive.
  Future<List<Product>> fetchSavedProducts() async {
    try {
      final box = await _productBox;
      return box.values.toList();
    } catch (e) {
      log.e("(ProductService) Error fetching saved products: $e");
      return [];
    }
  }

  /// Fetches a single product by ID from Hive.
  Future<Product?> fetchProduct(int id) async {
    try {
      final box = await _productBox;
      return box.get(id);
    } catch (e) {
      log.e("(ProductService) Error fetching product with ID $id: $e");
      return null;
    }
  }

  /// Saves a single product to Hive.
  Future<void> saveProduct(Product product) async {
    try {
      final box = await _productBox;
      await box.put(product.id, product);
      log.i("(ProductService) Saved ${product.title} (ID: ${product.id}) to Hive.");
    } catch (e) {
      log.e("(ProductService) Error saving product: $e");
    }
  }

  /// Deletes a single product by ID from Hive.
  Future<void> deleteProduct(int id) async {
    try {
      final box = await _productBox;
      await box.delete(id);
      log.i("(ProductService) Deleted product with ID $id.");
    } catch (e) {
      log.e("(ProductService) Error deleting product with ID $id: $e");
    }
  }

  /// Deletes all products from Hive.
  Future<void> deleteAllProducts() async {
    try {
      final box = await _productBox;
      await box.clear();
      log.i("(ProductService) Deleted all products.");
    } catch (e) {
      log.e("(ProductService) Error deleting all products: $e");
    }
  }
}
