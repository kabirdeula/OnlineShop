import 'package:flutter/material.dart';

import 'package:online_shop/core/constants/constants.dart';
import 'package:online_shop/features/product/product.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: AppDimensions.padding),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product.price}",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppDimensions.padding),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(product.image),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
