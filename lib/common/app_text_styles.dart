import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_const.dart';

class AppTextStyle {
  static const textWhite = TextStyle(
    color: AppColors.whiteAuth,
    fontFamily: AppConst.fontPoppins,
  );
  static const textBlack = TextStyle(
    color: AppColors.blackAuth,
    fontFamily: AppConst.fontPoppins,
  );
  static const textGray = TextStyle(
    color: AppColors.grayAuth,
    fontFamily: AppConst.fontPoppins,
  );

  static final textWhiteS10 = textWhite.copyWith(
    fontSize: 10,
  );

  static final textWhiterS10Bold = textWhite.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );
  static final textWhiteS14 = textWhite.copyWith(
    fontSize: 14,
  );

  static final textWhiterS14Bold = textWhite.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final textBlackS14 = textBlack.copyWith(
    fontSize: 14,
  );
  static final textBlackS14Bold = textBlack.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final textGrayS14 = textGray.copyWith(
    fontSize: 14,
  );
  static final textGrayS14Semi = textGray.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final textBlackS16 = textBlack.copyWith(
    fontSize: 16,
  );
  static final textBlackS16Semi = textBlack.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static final textBlackS16Bold = textBlack.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final textBlackS20Bold = textBlack.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final textWhiterS16 = textWhite.copyWith(
    fontSize: 16,
  );
  static final textWhiterS16Bold = textWhite.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final textWhiterS46Bold = textWhite.copyWith(
    fontSize: 46,
    fontWeight: FontWeight.bold,
  );
}
