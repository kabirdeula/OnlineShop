import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/constants/constants.dart';
import 'package:online_shop/core/utils/utils.dart';
import 'package:online_shop/features/product/presentation/widgets/product_card.dart';
import 'package:online_shop/features/product/product.dart';
import 'package:online_shop/routes/routes.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        if (state.products.isEmpty) {
          return const Center(child: Text("No products found"));
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.padding),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];

              return ProductCard(
                color: hexToColor(product.color),
                image: product.image,
                price: product.price,
                title: product.title,
                onTap: () => context.push(
                  AppRoutes.productDetail.path,
                  extra: product,
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppDimensions.padding,
              crossAxisSpacing: AppDimensions.padding,
              childAspectRatio: 0.72,
            ),
          ),
        );
      },
    );
  }
}
