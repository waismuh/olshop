import 'package:aostes/utils/constant.dart';
import 'package:flutter/material.dart';

TextStyle texth1() {
  return const TextStyle(
    fontWeight: FontUI.WEIGHT_BOLD,
    fontSize: 18,
    color: ColorUI.BLACK,
  );
}

TextStyle texth2() { return const TextStyle(
  fontWeight: FontUI.WEIGHT_REGULAR,
  fontSize: 20,
);
}

TextStyle texth3() {
  return const TextStyle(
    color: ColorUI.BLACK,
    fontWeight: FontUI.WEIGHT_BOLD,
    fontSize: 18,
  );
}

TextStyle texth4() {
  return const TextStyle(
    color: ColorUI.BLACK,
    fontWeight: FontUI.WEIGHT_BOLD,
    fontSize: 16,
  );
}

TextStyle texthgreen4() {
  return const TextStyle(
    color: ColorUI.GREEN,
    fontWeight: FontUI.WEIGHT_BOLD,
    fontSize: 16,
  );
}

TextStyle texth5({Color color = ColorUI.BLACK, FontStyle? style}) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontStyle: style,
  );
}

TextStyle texthgreen5() {
  return const TextStyle(
    color: ColorUI.GREEN,
    fontSize: 14,
  );
}

TextStyle texthbold5() {
  return const TextStyle(
    fontWeight: FontUI.WEIGHT_BOLD,
    color: ColorUI.BLACK,
    fontSize: 14,
  );
}

TextStyle texth6({
  Color color = ColorUI.BLACK,
  FontWeight weight = FontUI.WEIGHT_REGULAR,
}) {
  return TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: weight,
  );
}

TextStyle texthbold6() {
  return const TextStyle(
    fontWeight: FontUI.WEIGHT_BOLD,
    color: ColorUI.BLACK,
    fontSize: 12,
  );
}

TextStyle texth7({Color color = ColorUI.BLACK, double size = 10, FontWeight fontweight = FontUI.WEIGHT_REGULAR}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: fontweight
  );
}

TextStyle texthbold7() {
  return const TextStyle(
    fontWeight: FontUI.WEIGHT_BOLD,
    color: ColorUI.BLACK,
    fontSize: 10,
  );
}

TextStyle texthgrey7({Color color = ColorUI.CREAM_ACCENT}) {
  return TextStyle(
    color: color,
    fontSize: 10,
  );
}

TextStyle texth8() {
  return const TextStyle(fontSize: 12, color: ColorUI.CREAM_ACCENT);
}

TextStyle texthgreen8() {
  return const TextStyle(fontSize: 12, color: Color(ColorUI.MAIN_COLOR));
}

TextStyle textbodybold = const TextStyle(
  fontWeight: FontUI.WEIGHT_BOLD,
  fontSize: 14,
);

TextStyle textbodyregular = const TextStyle(
  fontWeight: FontUI.WEIGHT_REGULAR,
  fontSize: 14,
);

TextStyle textbodysemibold = const TextStyle(
  fontWeight: FontUI.WEIGHT_SEMI_BOLD,
  fontSize: 14,
);
