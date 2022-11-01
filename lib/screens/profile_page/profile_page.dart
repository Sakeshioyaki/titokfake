import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/AppControl/app_controll.dart';
import 'package:tiktok_fake/AppControl/user_controller.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/screens/auth_page/login_page.dart';
import 'package:tiktok_fake/screens/profile_page/widgets/video_item.dart';
import 'package:tiktok_fake/screens/setting/setting_privacy.dart';

class ProfilePage extends StatefulWidget {
  final Size? size;
  const ProfilePage({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  AppControl appControl = Get.find<AppControl>();

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
                                      style: AppTextStyle.textBlackS14Bold,
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
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        Get.to(() => const SettingPrivacy());
                                      },
                                      child: Text(
                                        "Cài đặt quyền riêng tư",
                                        style: AppTextStyle.textBlackS14Bold,
                                      ),
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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            // height: 500,
            color: AppColors.whiteAuth,
            child: Column(
              children: [
                buildHeader(),
                GetBuilder<AppControl>(builder: (logic) {
                  return logic.isLogin
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height - 364,
                          width: MediaQuery.of(context).size.width,
                          child: buildTabBarView(),
                        )
                      : const SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return GetBuilder<UserController>(builder: (logic) {
      return Column(
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
          appControl.isLogin ? buildBeHind() : buildBehindNotLogin(),
        ],
      );
    });
  }

  Widget buildBeHind() {
    return Column(
      children: [
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
          style: AppTextStyle.textBlackS14,
        ),
        const SizedBox(height: 10),
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: AppColors.whiteGrayAuth)),
          height: 40,
          child: TabBar(
            tabs: listTab,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: AppColors.blackAuth, width: 2.0),
              insets: EdgeInsets.symmetric(horizontal: 75),
            ),
            controller: _tabController,
          ),
        ),
      ],
    );
  }

  Widget buildBehindNotLogin() {
    return Container(
      color: AppColors.redAuth,
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.0),
              ),
            ),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SafeArea(
                child: Container(
                  height: widget.size!.height * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(
                                Icons.help_outline,
                                size: 25,
                                color: AppColors.grayAuth,
                              ),
                              SizedBox(width: 20)
                            ],
                          ),
                          const SizedBox(height: 80),
                          Text(
                            'Đăng ký TikTok',
                            style: AppTextStyle.textBlackS20Bold
                                .copyWith(letterSpacing: 0.5),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: widget.size!.width * 0.8,
                            child: const Text(
                              "Tạo hồ sơ, follow, các tài khoản khác, quay video của chính bạn, v.v..",
                              maxLines: 2,
                              style: AppTextStyle.textGray,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.redAuth),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                const Size.fromWidth(320),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  'Sử dụng số điện thoại hoặc email',
                                  style: AppTextStyle.textWhiterS14Bold,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              // backgroundColor:
                              //     MaterialStateProperty.all(AppColors.redAuth),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                const Size.fromWidth(320),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(AppImages.icGoogle, width: 20),
                                const SizedBox(width: 40),
                                Text(
                                  'Tiếp tục với Google',
                                  style: AppTextStyle.textBlackS14Bold,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              // backgroundColor:
                              //     MaterialStateProperty.all(AppColors.redAuth),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                const Size.fromWidth(320),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(AppImages.icFacebook, width: 20),
                                const SizedBox(width: 35),
                                Text(
                                  'Tiếp tục với Facebook',
                                  style: AppTextStyle.textBlackS14Bold,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 320,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: AppTextStyle.textGray.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                  children: [
                                    const TextSpan(
                                      text:
                                          'Bằng cách tiếp tục, bạn đồng ý với ',
                                    ),
                                    TextSpan(
                                      text: 'Điều khoản dịch vụ ',
                                      style: AppTextStyle.textBlack.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text:
                                          'của chúng tôi và thừa nhận rằng bạn đã đọc ',
                                    ),
                                    TextSpan(
                                      text: 'Chính sách Quyền riêng tư ',
                                      style: AppTextStyle.textBlack.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text:
                                          'để tìm hiểu cách chúng tôi thu thập, sử dụng và chia sẻ dữ liệu của bạn.',
                                    ),
                                  ]),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => LoginPage());
                            },
                            child: Container(
                              color: AppColors.whiteGrayAuth,
                              alignment: Alignment.center,
                              height: 60,
                              width: double.infinity,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: AppTextStyle.textBlack
                                        .copyWith(fontSize: 14),
                                    children: [
                                      const TextSpan(
                                        text: 'Bạn đã có tài khoản? ',
                                      ),
                                      TextSpan(
                                        text: 'Đăng nhập. ',
                                        style: AppTextStyle.textBlack.copyWith(
                                            color: AppColors.redAuth,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ]),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            useRootNavigator: true,
          );
        },
        child: Text(
          'Đăng nhập hoặc đăng ký',
          style: AppTextStyle.textWhiterS16Bold,
        ),
      ),
    );
  }

  Widget buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 1 / 1.3,
          ),
          itemCount: listImage.length,
          itemBuilder: (_, int index) {
            return Container(
              color: Colors.redAccent,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  VideoPlayerItem(
                    videoUrl: 'assets/videos/video_1.mp4',
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
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
                          style: AppTextStyle.textWhiteS14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const Center(
          child: Text("It's rainy here"),
        ),
      ],
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
                  style: AppTextStyle.textGrayS14,
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
                  style: AppTextStyle.textGrayS14,
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
                  style: AppTextStyle.textGrayS14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
