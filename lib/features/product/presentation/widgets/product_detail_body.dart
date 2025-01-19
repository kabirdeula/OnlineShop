import 'package:flutter/material.dart';

import 'package:online_shop/features/product/product.dart';

class ProductDetailBody extends StatelessWidget {
  final Product product;

  const ProductDetailBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final productColors = [
      Color(0xFF356C95),
      Color(0xFFF8C078),
      Color(0xFFA29B9B),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                ProductDetailContent(
                  size: size,
                  productColors: productColors,
                  product: product,
                ),
                ProductHeader(product: product)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
