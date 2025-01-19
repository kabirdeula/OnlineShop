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
        spacing: AppDimensions.padding * 2.5,
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
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    AppIcons.heart,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          
          Row(
            spacing: 12,
            children: [
              Container(
                padding: EdgeInsets.all(AppDimensions.padding / 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                child: IconButton(
                    onPressed: () {}, icon: Icon(AppIcons.addToCart)),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: productColors.first,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.all(AppDimensions.padding)),
                  onPressed: () {},
                  child: Text(
                    "buy now".toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
