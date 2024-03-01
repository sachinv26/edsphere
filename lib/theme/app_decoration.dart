import 'package:flutter/material.dart';
import 'package:schoolapp/core/app_export.dart';

class AppDecoration {

  static BoxDecoration get gradientLightBlueToLightBlue => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.lightBlue300,
            appTheme.lightBlue300.withOpacity(0.45),
            appTheme.lightBlue300.withOpacity(0),
          ],
        ),
      );
  static BoxDecoration get outlineBluegray10001 => BoxDecoration(
        color: appTheme.gray50,
        border: Border.all(
          color: appTheme.blueGray10001,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray90033,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              2,
              2,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
}

