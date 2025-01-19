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
          body: ProductDetailBody(product: product),
        );
      },
    );
  }
}
