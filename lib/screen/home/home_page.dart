import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/const/data_json.dart';
import 'package:tiktok_fake/screen/home/vide_player_item.dart';
import 'package:tiktok_fake/screen/home/widget/indicator_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  PageController controller = PageController();
  PageController controller1 = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        body: Stack(
          children: [
            TabBarView(
              physics: const ClampingScrollPhysics(),
              controller: _tabController,
              children: [
                PageView(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  // onPageChanged: () {},
                  children: List.generate(items.length, (index) {
                    return RotatedBox(
                      quarterTurns: 1,
                      child: VideoPlayerItem(
                        videoUrl: items[index]['videoUrl'],
                        size: size,
                        name: items[index]['name'],
                        caption: items[index]['caption'],
                        songName: items[index]['songName'],
                        profileImg: items[index]['profileImg'],
                        likes: items[index]['likes'],
                        comments: items[index]['comments'],
                        shares: items[index]['shares'],
                        albumImg: items[index]['albumImg'],
                        bookMark: items[index]['bookmark'],
                      ),
                    );
                  }),
                ),
                PageView(
                  scrollDirection: Axis.vertical,
                  controller: controller1,
                  // onPageChanged: (num) {},
                  children: List.generate(items.length, (index) {
                    return RotatedBox(
                      quarterTurns: 1,
                      child: VideoPlayerItem(
                        videoUrl: items[index]['videoUrl'],
                        size: size,
                        name: items[index]['name'],
                        caption: items[index]['caption'],
                        songName: items[index]['songName'],
                        profileImg: items[index]['profileImg'],
                        likes: items[index]['likes'],
                        comments: items[index]['comments'],
                        shares: items[index]['shares'],
                        albumImg: items[index]['albumImg'],
                        bookMark: items[index]['bookmark'],
                      ),
                    );
                  }),
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
                        controller: _tabController,
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
        ),
      ),
    );
  }
}
