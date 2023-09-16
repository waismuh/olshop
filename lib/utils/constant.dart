import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ColorUI {
  static const MAIN_COLOR = 0xFF1D741B;
  static const SECOND_COLOR = 0xFFFFCD1C;

  static const WHITE = Colors.white;
  static const GREEN = Color(MAIN_COLOR);
  static const GREEN_PSIGN = Color(0xFF00D823);
  static const PRIMARY_TEXT = Color(0xFF5B727D);
  static const BLUE_PSIGN = Color(0xFF0F4C81);
  static const TEXT_GREY = Color(0xFFB0B0B0);
  static const TEXT_RED = Color(0xFFD80000);
  static const TEXT_YELLOW = Color(0xFFD8B500);
  static const BG_LABEL = Color(0xFFE7F5FD);
  static const BG_GREEN_LIGHT = Color(0xFFECFFEC);
  static const BG_BLUE_LIGHT = Color(0xFFECF6FF);
  static const BG_RED_LIGHT = Color(0xFFFFECEC);
  static const BG_YELLOW_LIGHT = Color(0xFFFFFDEC);
  static const BG_1 = Color(0xFFF6F6F6);
  static const BLUE_TEXT = Color(0xFF007DD8);
  static const TEXT_1 = Color(0xFFFF8F00);


  static const GREEN_ACCENT = Color(0xFFD2E3D1);
  static const BLUE_ACCENT = Color(0xFFC8D4FF);
  static const YELLOW = Color(SECOND_COLOR);
  static const YELLOW_ACCENT = Color(0xFFFFF5D2);
  static const RED = Color(0xFFFF6868);
  static const RED_ACCENT = Color(0xFFFEDEDE);
  static const BLACK = Color(0xFF333333);
  static const GREY = Color(0xFF858585);
  static const GREY_ACCENT = Color(0xFFF1F1F1);
  static const CHOCO = Color(0xFFB47F41);
  static const CHOCO_ACCENT = Color(0xFFF5EBDF);
  static const CREAM = Color(0xFFEFEFEF);
  static const CREAM_ALT = Color(0xFFD6D6D6);
  static const CREAM_ACCENT = Color(0xFF858585);
  static const CREAM_ACCENT_2 = Color(0xFFBDBDBD);
  static const BORDER = Color(0xffE5E5E5);
  static const BLACK_1 = Color(0xFF333333);
  static const BTN_GREY = Color(0xFFE1E1E1);
  // static const TEXT_GREY = Color(0xFF8F8F8F);
  // static const TEXT_YELLOW = Color(0xFFEC9C00);

  static const PROGRESS_TX = Color(0xFF668EDE);
  static const PROGRESS_BG = Color(0xFFD6E0F4);
  static const PROGRESS_FG = Color(0xFF799CE2);

}

class FormatPsign{
  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = [" b", " kb", " mb", " gb", " tb"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}

class FontUI {
  static const WEIGHT_LIGHT = FontWeight.w300;
  static const WEIGHT_REGULAR = FontWeight.w400;
  static const WEIGHT_SEMI_BOLD = FontWeight.w600;
  static const WEIGHT_BOLD = FontWeight.w700;
}

class BorderUI {
  static const RADIUS_BUTTON = 4.0;
  static const RADIUS_CIRCULAR = 8.0;
  static const RADIUS_ROUND = 50.0;
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

List<BoxShadow> containerShadow({
  double blurRadius = 0.2,
  double spreadRadius = 1,
  Offset offset = const Offset(0, 5),
}) {
  return [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
      offset: offset,
    ),
  ];
}

BoxDecoration decorBord({Color color = ColorUI.GREEN}) {
  return BoxDecoration(color: color);
}

List<Widget> notchBottomSheet() {
  return [
    SizedBox(height: 12.0),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        ),
      ],
    ),
    SizedBox(height: 18.0),
  ];
}
