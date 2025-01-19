import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/constants/constants.dart';
import 'package:online_shop/core/utils/utils.dart';
import 'package:online_shop/features/product/presentation/widgets/product_card.dart';
import 'package:online_shop/features/product/product.dart';
import 'package:online_shop/routes/routes.dart';

/// A widget that displays a grid of products fetched from the state.
class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final products = state.productList;
        if (products == null || products.isEmpty) {
          return const Center(
            child: Text("No products available"),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.padding),
          child: _buildProductGrid(products),
        );
      },
    );
  }

  /// Builds the grid view for displaying products.
  Widget _buildProductGrid(List<Product> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          color: hexToColor(product.color),
          image: product.image,
          price: product.price,
          title: product.title,
          onTap: () => _navigateToProductDetail(context, product.id),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppDimensions.padding,
        crossAxisSpacing: AppDimensions.padding,
        childAspectRatio: 0.72,
      ),
    );
  }

  /// Navigates to the product detail screen for a specific product ID.
  void _navigateToProductDetail(BuildContext context, int productId) {
    context.push("${AppRoutes.productDetail.path}/$productId");
  }
}
