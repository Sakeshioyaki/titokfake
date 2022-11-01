import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static Future<void> messages({
    @required String? message,
    String? title,
    String? titleButton,
    VoidCallback? onTapOk,
    bool? iconNext = false,
  }) async {
    Get.generalDialog(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: Get.width * 0.7,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  title != null
                      ? Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            title,
                            // style: AppTextStyle.textSize_18.copyWith(
                            //   color: AppColors.titleColors,
                            // ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      message ?? '!',
                      // style: AppTextStyle.textSize_18.copyWith(
                      //   color: AppColors.mainTextColor,
                      // ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 0.5,
                    width: Get.width,
                    // color: AppColors.borderColors,
                  ),
                  GestureDetector(
                    onTap: onTapOk ??
                        () {
                          Get.back();
                        },
                    child: Container(
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const SizedBox(width: 25),
                          Expanded(
                            child: Text(
                              titleButton ?? 'OK',
                              // style: AppTextStyle.textSizeBold_16.copyWith(
                              //   color: AppColors.mainColor,
                              //   fontWeight: FontWeight.w600,
                              // ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          iconNext == true
                              ? const Icon(
                                  Icons.navigate_next_outlined,
                                  // color: AppColors.borderColors,
                                  size: 15,
                                )
                              : const SizedBox(width: 15),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }
}
