import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return WebLayoutScreen();
        } else {
          return MobileLayoutScreen();
        }
      }),
    );
  }
}
