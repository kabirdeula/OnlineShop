import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:online_shop/core/constants/constants.dart';
import 'package:online_shop/features/product/product.dart';

class ProductColorsSelector extends StatelessWidget {
  final List<Color> productColors;

  const ProductColorsSelector({super.key, required this.productColors});

  @override
  Widget build(BuildContext context) {
    final selectedColor = context.watch<ProductCubit>().state.selectedColor;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Color"),
          Row(
            children: productColors.map((color) {
              final isSelected = selectedColor == color;
              return GestureDetector(
                onTap: () =>
                    context.read<ProductCubit>().changeSelectedColor(color),
                child: Container(
                  height: 26,
                  width: 26,
                  margin: EdgeInsets.only(
                    top: AppDimensions.padding / 4,
                    right: AppDimensions.padding / 2,
                  ),
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? color : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
