import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Image.asset(
            AppImages.icBack,
            width: 8,
          ),
        ),
        elevation: 0,
        title: Center(
          child: Text(
            'Some one',
            style: AppTextStyle.textBlackS16Bold,
          ),
        ),
        actions: [
          Image.asset(
            AppImages.icNotification,
            width: 22,
          ),
          const SizedBox(
            width: 18,
          ),
          Image.asset(
            AppImages.icShowMore,
            width: 22,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
        backgroundColor: AppColors.whiteAuth,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Image.network(
                'https://p16-tiktokcdn-com.akamaized.net/aweme/720x720/tiktok-obj/ba13e655825553a46b1913705e3a8617.jpeg',
                width: 100,
              ),
            ),
          ),
          const SizedBox(height: 11),
          Text(
            '@Someone',
            style: AppTextStyle.textBlackS16,
          ),
          Container(
            height: 46,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Text(
                        '0',
                        style: AppTextStyle.textBlackS16Bold,
                      ),
                      Text(
                        'Follower',
                        style: AppTextStyle.textGrayS13,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, int index) => SizedBox(
                height: 10.0,
                child: new Container(
                  margin: new EdgeInsetsDirectional.only(start: 0.3, end: 0.6),
                  height: 5.0,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
