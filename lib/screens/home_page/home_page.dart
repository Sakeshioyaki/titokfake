import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/screens/home_page/home_controller.dart';
import 'package:tiktok_fake/screens/home_page/video_player_item/vide_player_item.dart';
import 'package:tiktok_fake/screens/home_page/widget/indicator_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Get.put<HomeController>(HomeController());

  @override
  initState() {
    super.initState();
    homeController.fetchInitialMovies();
    homeController.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tapsList = [
      const Tab(text: 'Đang Follow '),
      const Tab(text: 'Dành cho bạn')
    ];
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        body: GetBuilder<HomeController>(builder: (_) {
          return Stack(
            children: [
              TabBarView(
                physics: const ClampingScrollPhysics(),
                controller: _.tabController,
                children: [
                  PageView.builder(
                    scrollDirection: Axis.vertical,
                    controller: _.controller,
                    itemBuilder: (BuildContext context, int index) {},
                  ),
                  PageView(
                    scrollDirection: Axis.vertical,
                    controller: _.controller1,
                    children: List.generate(
                      _.listVideo.length,
                      (index) {
                        return RotatedBox(
                          quarterTurns: 1,
                          child: VideoPlayerItem(
                            size: size,
                            video: _.listVideo[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppImages.icLiveIcon,
                        width: 28,
                      ),
                      Container(
                        width: 280,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TabBar(
                          isScrollable: true,
                          unselectedLabelColor:
                              AppColors.whiteAuth.withOpacity(0.5),
                          labelColor: AppColors.whiteAuth,
                          controller: _.tabController,
                          tabs: tapsList,
                          labelStyle: AppTextStyle.textWhiterS14Bold,
                          indicator: CircleTabIndicator(
                              color: AppColors.whiteAuth,
                              radius: 1.5,
                              width: 30,
                              weight: 3.0),
                        ),
                      ),
                      Image.asset(
                        AppImages.icSearch,
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
