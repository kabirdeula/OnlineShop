import 'package:flutter/material.dart';
import 'package:online_shop/core/constants/constants.dart';
import 'package:online_shop/routes/routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  final List<Widget>? actions;
  final Widget? leading;
  final bool showBackButton;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.showBackButton = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? BackButton(
              color: AppColors.text,
              onPressed: () => context.pop(),
            )
          : leading,
      title: Text(title ?? ''),
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
