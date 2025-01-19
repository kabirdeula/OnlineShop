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

        return Scaffold(
          backgroundColor: hexToColor(product.color),
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
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(AppDimensions.padding))
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
