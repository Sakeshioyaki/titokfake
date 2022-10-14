import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
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
  late TabController _mainTabController;

  List<Widget> tapsList = [
    Text(
      "Following",
      style: TextStyle(
        color: AppColors.whiteAuth,
        fontSize: 16,
      ),
    ),
    const Text(
      "For You",
      style: TextStyle(
          color: AppColors.whiteAuth,
          fontSize: 17,
          fontWeight: FontWeight.w500),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mainTabController = TabController(length: 2, vsync: this);
    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return VideoPlayerItem(
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
          );
        }),
      ),
    );
  }
}
