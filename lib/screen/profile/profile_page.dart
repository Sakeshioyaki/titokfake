import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/screen/profile/Widget/video_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> listTab = [
    Tab(
      child: Center(
        child: Image.asset(
          AppImages.icPhotoGallery,
          height: 17,
        ),
      ),
    ),
    Tab(
      child: Center(
        child: Image.asset(
          AppImages.icLikeNotSeen,
          height: 17,
        ),
      ),
    ),
  ];

  List<String> listImage = [
    'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    height: size.height * 0.2,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      AppImages.icPeopleSetting,
                                      width: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Công cụ dành cho Tác giả",
                                      style: AppTextStyle.textBlackS13Bold,
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.redAccent,
                                      borderRadius: BorderRadius.circular(4)),
                                  height: 8,
                                  width: 8,
                                )
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: AppColors.grayLightAuth,
                          height: 1,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      AppImages.icSetting,
                                      width: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Cài đặt quyền riêng tư",
                                      style: AppTextStyle.textBlackS13Bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: AppColors.grayLightAuth,
                          height: 1,
                        ),
                      ],
                    ),
                  );
                },
                useRootNavigator: true,
              );
            },
            child: Image.asset(
              AppImages.icShowMore,
              width: 22,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
        backgroundColor: AppColors.whiteAuth,
      ),
      body: Container(
        color: AppColors.whiteAuth,
        child: Column(
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
            buildInformation(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 150,
                    color: AppColors.redAccent,
                    child: Text(
                      'Follow',
                      style: AppTextStyle.textWhiterS16,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grayLightAuth)),
                  child: Center(
                    child: Image.asset(
                      AppImages.icMore,
                      height: 10,
                      width: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'No bio yet ',
              style: AppTextStyle.textBlackS13,
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteGrayAuth)),
              height: 40,
              child: TabBar(
                tabs: listTab,
                indicator: const UnderlineTabIndicator(
                  borderSide:
                      BorderSide(color: AppColors.blackAuth, width: 2.0),
                  insets: EdgeInsets.symmetric(horizontal: 75),
                ),
                controller: _tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: listImage.length,
                    // padding: const EdgeInsets.all(2),
                    itemBuilder: (_, int index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1),
                            child: VideoPlayerItem(
                              videoUrl: 'assets/videos/video_1.mp4',
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.icPlay,
                                  height: 12,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '0',
                                  style: AppTextStyle.textWhiteS13,
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  const Center(
                    child: Text("It's rainy here"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildInformation() {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  '0',
                  style: AppTextStyle.textBlackS16Bold,
                ),
                Text(
                  'Following',
                  style: AppTextStyle.textGrayS13,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            height: 18,
            width: 1,
            color: AppColors.grayLightAuth,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  '0',
                  style: AppTextStyle.textBlackS16Bold,
                ),
                Text(
                  'Followers',
                  style: AppTextStyle.textGrayS13,
                ),
              ],
            ),
          ),
          Container(
            height: 18,
            width: 1,
            color: AppColors.grayLightAuth,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  '0',
                  style: AppTextStyle.textBlackS16Bold,
                ),
                Text(
                  'Likes',
                  style: AppTextStyle.textGrayS13,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
