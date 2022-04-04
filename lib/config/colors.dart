import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Colors config
class AppColors {
  ///Gradients
  static final addProjectHeaderGradient1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff94BB44),
      Color(0xff3D8B79),
    ],
  );

  static final addProjectHeaderGradient2 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    colors: [
      Color(0xffA9D847),
      Color(0xff4B9D8A),
    ],
  );

  static final addProjectHeaderGradient3 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    stops: [0, 0.6],
    // transform: GradientRotation(degToRad(175)),
    colors: [
      Color(0xffA9D847),
      Color(0xff4B9D8A),
    ],
  );

  ///Palette keeps base colors
  /// for pick them from semantic colors
  ///
  /// color naming
  /// https://www.color-blindness.com/color-name-hue/
  static const almostBlack = const Color(0xFF17181A);
  static const black = const Color(0xFF000000);
  static const darkGrey = const Color(0xFF515151);
  static const lightGrey = const Color(0xFFBDBDBE);
  static const xLight = const Color(0xFF515151);
  static const xxLight = const Color(0xFFF4F4F4);
  static const lightGreen = const Color(0xFFFAFFEF);
  static const lightYellow = const Color(0xFFF4FFDC);
  static const oliveDrab = const Color(0xFF5C7C18);
  static const darkGreen = const Color(0xFF73962C);
  static const green = const Color(0xFF99C63C);
  static const conifer = const Color(0xFFA9D847);
  static const conifer2 = const Color(0xFFABDB49);
  static const lochinvar = const Color(0xFF4B9D8A);
  static const orange = const Color(0xFFFBC24A);
  static const tangerine = const Color(0xFFED8B00);
  static const red = const Color(0xFFDD0B25);
  static const blue = const Color(0xFF2268B4);
  static const viking = const Color(0xFF3CA5C6);
  static const shamrock = const Color(0xFF3CC6AD);
  static const white = const Color(0xFFFFFFFF);
}
