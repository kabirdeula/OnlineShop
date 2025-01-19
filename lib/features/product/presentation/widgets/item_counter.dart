import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:online_shop/features/product/product.dart';

class ItemCounter extends StatelessWidget {
  const ItemCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        OutlinedButton.icon(
          onPressed: () =>
              context.read<ProductCubit>().decrementCounter(),
          label: Icon(Icons.remove),
        ),
        BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
          return Text(
            "${state.counter}",
            style: Theme.of(context).textTheme.headlineSmall,
          );
        }),
        OutlinedButton(
          onPressed: () =>
              context.read<ProductCubit>().incrementCounter(),
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
