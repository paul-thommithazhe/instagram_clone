import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  Widget webScreenLayout;
  Widget mobileScreenLayout;
  ResponsiveLayout(
      {Key? key,
      required this.mobileScreenLayout,
      required this.webScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webScreenLayout;
        } else {
          return mobileScreenLayout;
        }
      }),
    );
  }
}
