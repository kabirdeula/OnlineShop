import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:online_shop/core/constants/constants.dart';
import 'package:online_shop/core/utils/utils.dart';
import 'package:online_shop/core/widgets/widgets.dart';
import 'package:online_shop/features/product/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productID;

  const ProductDetailScreen({super.key, required this.productID});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    context
        .read<ProductCubit>()
        .loadProductById(productId: int.parse(productID));

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final product = state.selectedProduct;

        if (product == null) {
          return const Center(child: Text("Product not found"));
        }

        final productColors = [
          Color(0xFF356C95),
          Color(0xFFF8C078),
          Color(0xFFA29B9B),
        ];

        return Scaffold(
          backgroundColor: state.selectedColor ?? hexToColor(product.color),
          appBar: CustomAppBar(
            showBackButton: true,
            actions: [
              IconButton(
                icon: Icon(AppIcons.search, color: AppColors.text),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(AppIcons.cart, color: AppColors.text),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height,
                  child: Stack(
                    children: [
                      Container(
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
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Color"),
                                      Row(
                                        children: productColors.map((color) {
                                          final isSelected =
                                              state.selectedColor == color;
                                          return GestureDetector(
                                            onTap: () => context
                                                .read<ProductCubit>()
                                                .changeSelectedColor(color),
                                            child: Container(
                                              height: 26,
                                              width: 26,
                                              margin: EdgeInsets.only(
                                                top: AppDimensions.padding / 4,
                                                right:
                                                    AppDimensions.padding / 2,
                                              ),
                                              padding:
                                                  const EdgeInsets.all(2.5),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: isSelected
                                                      ? color
                                                      : Colors.transparent,
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
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: AppColors.text),
                                      children: [
                                        TextSpan(text: "Size\n"),
                                        TextSpan(
                                          text: "${product.size} cm",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppDimensions.padding),
                              child: Text(
                                product.description,
                                style: TextStyle(height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.padding,
                                ),
                                Expanded(child: Image.asset(product.image)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
