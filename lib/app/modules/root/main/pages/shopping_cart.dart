import 'package:flutter/material.dart';
import 'package:storybook/app/config/constants/app_Appbar.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarApp(title: 'Cart'),
    );
  }
}
