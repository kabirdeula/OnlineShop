import 'package:flutter/material.dart';
import 'package:online_shop/core/constants/constants.dart';
import 'package:online_shop/core/widgets/widgets.dart';
import 'package:online_shop/features/product/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return DefaultTabController(
      length: ListStrings.categories.length,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              'Women',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TabBar(tabs: ListStrings.categories, isScrollable: true),
            Expanded(
              child: TabBarView(
                children: [
                  ProductGridView(),
                  ProductGridView(),
                  ProductGridView(),
                  ProductGridView()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
