import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteAuth,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(color: Colors.black, size: 19, Icons.arrow_back_ios),
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'Someone',
            style: AppTextStyle.textBlackS16Bold,
          ),
        ),
        actions: const [
          SizedBox(
            width: 60,
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: 19,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.redAccent,
                  child: Center(child: Text('Entry ')),
                ),
                Container(
                  height: 20,
                  color: Colors.transparent,
                )
              ],
            );
          }),
    );
  }
}
