import 'package:flutter/material.dart';
import 'package:storybook/app/config/constants/app_Appbar.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarApp(title: 'Search'),
    );
  }
}
