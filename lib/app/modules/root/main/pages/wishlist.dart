import 'package:flutter/material.dart';
import 'package:storybook/app/config/constants/app_Appbar.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarApp(title: 'Wishlist'),
    );
  }
}
