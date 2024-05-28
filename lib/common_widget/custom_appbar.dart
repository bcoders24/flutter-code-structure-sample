import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackPressed;
  final double appBarHeight; // New property to specify the app bar height

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.appBarHeight = kToolbarHeight, // Default height is kToolbarHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight); // Use custom height
}
