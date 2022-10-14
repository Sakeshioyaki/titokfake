import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';

class HeaderHomePage extends StatefulWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> tapsList = [
    Text(
      "Following",
      style: TextStyle(
        color: AppColors.whiteAuth.withOpacity(0.7),
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
    _tabController = TabController(vsync: this, length: tapsList.length);
  }

  @override
  Widget build(BuildContext context) {
    return
        //   Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text(
        //       "Following",
        //       style: TextStyle(
        //         color: AppColors.whiteAuth.withOpacity(0.7),
        //         fontSize: 16,
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 8,
        //     ),
        //     Text(
        //       "|",
        //       style: TextStyle(
        //         color: AppColors.whiteAuth.withOpacity(0.3),
        //         fontSize: 17,
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 8,
        //     ),
        //     const Text(
        //       "For You",
        //       style: TextStyle(
        //           color: AppColors.whiteAuth,
        //           fontSize: 17,
        //           fontWeight: FontWeight.w500),
        //     )
        //   ],
        // )
        TabBar(
      tabs: tapsList,
      controller: _tabController,
    );
  }
}
