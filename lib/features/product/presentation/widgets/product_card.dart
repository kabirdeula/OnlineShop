import 'package:flutter/material.dart';
import 'package:online_shop/core/constants/constants.dart';

class ProductCard extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final double price;

  const ProductCard({
    super.key,
    required this.color,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(AppDimensions.padding),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.padding / 4,
          ),
          child: Text(title, style: TextStyle(color: AppColors.textLight)),
        ),
        Text("\$ $price", style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
