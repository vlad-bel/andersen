import 'package:andersen_test1/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const _sfProDisplay = TextStyle(fontFamily: 'SF Pro Display');

  static TextStyle h1 = GoogleFonts.lato(
    fontSize: 46,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w900,
  );

  static TextStyle h2 = GoogleFonts.lato(
    fontSize: 28,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodyNormal = GoogleFonts.lato(
    fontSize: 17,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyBold = GoogleFonts.lato(
    fontSize: 17,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodyS = GoogleFonts.lato(
    fontSize: 15,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodySBold = GoogleFonts.lato(
    fontSize: 15,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w700,
  );

  static TextStyle small = GoogleFonts.lato(
    fontSize: 13,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w400,
  );

  static TextStyle smallBold = GoogleFonts.lato(
    fontSize: 13,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w700,
  );

  static TextStyle captionNormal = GoogleFonts.lato(
    fontSize: 12,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w400,
  );

  static TextStyle captionBold = GoogleFonts.lato(
    fontSize: 12,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w700,
  );

  static TextStyle captionS = GoogleFonts.lato(
    fontSize: 9,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w400,
  );

  static TextStyle robotoRegular12 = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w400,
  );

  static TextStyle robotoBold12 = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w700,
  );

  static TextStyle sfProDisplaySemiBold17 = _sfProDisplay.copyWith(
    fontSize: 17,
    color: AppColors.almostBlack,
    fontWeight: FontWeight.w600,
  );
}