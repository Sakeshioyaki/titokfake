import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/const/data_json.dart';
import 'package:tiktok_fake/screen/home/vide_player_item.dart';

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
    List<Tab> tapsList = [Tab(text: 'Đang Follow'), Tab(text: 'Dành cho bạn')];
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              physics: ClampingScrollPhysics(),
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
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset(
                        AppImages.icLiveIcon,
                        width: 24,
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      child: TabBar(
                        isScrollable: true,
                        padding: EdgeInsets.only(top: 10),
                        unselectedLabelColor:
                            AppColors.whiteAuth.withOpacity(0.5),
                        labelColor: AppColors.whiteAuth,
                        controller: _tabController,
                        tabs: tapsList,
                        labelStyle: AppTextStyle.textWhiterS16Bold,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                              width: 3.0, color: AppColors.whiteAuth),
                          insets: EdgeInsets.symmetric(horizontal: 40),
                        ),
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        AppImages.icDiscover,
                        width: 20,
                      ),
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
