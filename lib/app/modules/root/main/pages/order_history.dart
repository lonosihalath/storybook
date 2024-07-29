import 'package:flutter/material.dart';
import 'package:storybook/app/config/constants/app_Appbar.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarApp(title: 'History'),
    );
  }
}
