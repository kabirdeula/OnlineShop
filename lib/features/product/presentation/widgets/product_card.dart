import 'package:flutter/material.dart';
import 'package:online_shop/core/constants/constants.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final Color color;
  final String image;
  final String title;
  final double price;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.id,
    required this.color,
    required this.image,
    required this.title,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(AppDimensions.padding),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Hero(tag: "$id", child: Image.asset(image)),
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
      ),
    );
  }
}
