import 'package:flutter/material.dart';
import 'package:storybook/app/config/constants/app_Appbar.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarApp(title: 'Setting'),
    );
  }
}
