import 'package:flutter/material.dart';

import 'package:online_shop/core/constants/constants.dart';
import 'package:online_shop/features/product/product.dart';

class ProductDetailsRow extends StatelessWidget {
  final List<Color> productColors;
  final Product product;

  const ProductDetailsRow({
    super.key,
    required this.productColors,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductColorsSelector(productColors: productColors),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: AppColors.text),
              children: [
                TextSpan(text: "Size\n"),
                TextSpan(
                  text: "${product.size} cm",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
