import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';

class SliverAppPadding extends StatelessWidget {
  const SliverAppPadding({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.appPadding.w,
      ),
      sliver: child,
    );
  }
}
