import 'package:flutter/material.dart';

import 'package:online_shop/core/constants/constants.dart';
import 'package:online_shop/features/product/product.dart';

class ProductDetailContent extends StatelessWidget {
  final Size size;
  final List<Color> productColors;
  final Product product;

  const ProductDetailContent({
    super.key,
    required this.size,
    required this.productColors,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3),
      padding: EdgeInsets.only(
        top: size.height * 0.12,
        left: AppDimensions.padding,
        right: AppDimensions.padding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsRow(productColors: productColors, product: product),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.padding),
            child: Text(
              product.description,
              style: TextStyle(height: 1.5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemCounter(),
              SizedBox(width: 75, height: 50, child: Placeholder()),
            ],
          )
        ],
      ),
    );
  }
}
