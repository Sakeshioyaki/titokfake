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
  static final textWhiteS13 = textWhite.copyWith(
    fontSize: 13,
  );

  static final textWhiterS13Bold = textWhite.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
  static final textBlackS13 = textBlack.copyWith(
    fontSize: 13,
  );
  static final textBlackS13Bold = textBlack.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
  static final textGrayS13 = textGray.copyWith(
    fontSize: 13,
  );
  static final textBlackS16 = textBlack.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static final textBlackS16Bold = textBlack.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final textWhiterS16 = textWhite.copyWith(
    fontSize: 16,
  );
  static final textWhiterS16Bold = textWhite.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
