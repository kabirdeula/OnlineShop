import 'package:flutter/material.dart';
import 'package:online_shop/core/utils/utils.dart';
import 'package:online_shop/core/widgets/widgets.dart';
import 'package:online_shop/features/product/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor(product.color),
      appBar: CustomAppBar(showBackButton: true,),
    );
  }
}
