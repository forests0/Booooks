import 'package:flutter/material.dart';

class appScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
    BuildContext context, Widget child, AxisDirection axisDirection
  ) {
    return child;
  }
}