import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/screens/home_page/home_controller.dart';
import 'package:tiktok_fake/screens/home_page/video_player_item/video_player_item.dart';
import 'package:tiktok_fake/screens/home_page/widgets/indicator_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeController vm = Get.put<HomeController>(HomeController());

  @override
  initState() {
    super.initState();
    vm.tabController = TabController(length: 2, vsync: this);
    vm.fetchInitialMovies();
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
        body: buildBody(size, tapsList),
      ),
    );
  }

  Widget buildBody(Size size, List<Tab> tapsList) {
    return SizedBox.expand(
      child: Stack(
        children: [
          GetBuilder<HomeController>(
            builder: (logic) {
              return TabBarView(
                physics: const ClampingScrollPhysics(),
                controller: logic.tabController,
                children: [
                  SizedBox(
                    height: Get.height,
                    child: PageView.builder(
                      itemCount: logic.listVideo.length,
                      scrollDirection: Axis.vertical,
                      controller: logic.controller,
                      itemBuilder: (BuildContext context, int index) {
                        return RotatedBox(
                          quarterTurns: 1,
                          child: VideoPlayerItem(
                            size: MediaQuery.of(context).size,
                            video: logic.listVideo[index],
                            tag: index,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    height: Get.height,
                    child: logic.listVideo.isNotEmpty
                        ? PageView.builder(
                            itemCount: logic.listVideo.length,
                            scrollDirection: Axis.vertical,
                            controller: logic.controller1,
                            itemBuilder: (BuildContext context, int index) {
                              return RotatedBox(
                                quarterTurns: 1,
                                child: VideoPlayerItem(
                                  size: size,
                                  video: logic.listVideo[index],
                                  tag: index,
                                ),
                              );
                            },
                          )
                        : const SizedBox(),
                  ),
                ],
              );
            },
          ),
          GetBuilder<HomeController>(
            builder: (logic) {
              return SafeArea(
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
                          controller: logic.tabController,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
