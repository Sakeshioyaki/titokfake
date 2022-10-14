import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_const.dart';

class AppTextStyle {
  static const textWhite = TextStyle(
    color: AppColors.whiteAuth,
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
}
