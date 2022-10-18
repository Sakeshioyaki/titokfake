import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';

class RightPanel extends StatelessWidget {
  final String? likes;
  final String? comments;
  final String? shares;
  final String? profileImg;
  final String? albumImg;
  final String? bookMark;
  const RightPanel({
    Key? key,
    required this.size,
    this.likes,
    this.comments,
    this.shares,
    this.profileImg,
    this.albumImg,
    this.bookMark,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            buildProfile(),
            const SizedBox(height: 34),
            buildLikes(),
            const SizedBox(height: 23),
            GestureDetector(
                onTap: () {
                  buildCommentContent(context);
                },
                child: buildComments()),
            const SizedBox(height: 23),
            Column(
              children: [
                Image.asset(
                  AppImages.icBookMark,
                  width: 34,
                ),
                const SizedBox(height: 6),
                Text(
                  bookMark!,
                  style: AppTextStyle.textWhiteS13,
                ),
              ],
            ),
            const SizedBox(height: 23),
            buildShare(),
            const SizedBox(height: 30),
            buildMusicAlbum()
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildCommentContent(BuildContext context) {
    return showModalBottomSheet(
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
            vertical: 12,
          ),
          height: size.height * 0.75,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  Text(
                    "${comments!} bình luận",
                    style: AppTextStyle.textBlackS13Bold,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      AppImages.icClose,
                      width: 13,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Row(
                        children: [
                          Image.asset(
                            AppImages.icPeopleSetting,
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text('Name'),
                              Text('contentafjgafgslafg fkjsghfsdyfcskbfys')
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
      useRootNavigator: true,
    );
  }

  Widget buildMusicAlbum() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            AppImages.imgDisc,
            height: 50,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          // color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              albumImg!,
              height: 28,
              width: 28,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildComments() {
    return Column(
      children: [
        Image.asset(
          AppImages.icMessageHome,
          width: 34,
        ),
        const SizedBox(height: 6),
        Text(
          comments!,
          style: AppTextStyle.textWhiteS13,
        ),
      ],
    );
  }

  Widget buildShare() {
    return Column(
      children: [
        Image.asset(
          AppImages.icShare,
          width: 34,
        ),
        const SizedBox(height: 6),
        Text(
          shares!,
          style: AppTextStyle.textWhiteS13,
        ),
      ],
    );
  }

  Widget buildLikes() {
    return Column(
      children: [
        Image.asset(
          AppImages.icHeart,
          width: 34,
        ),
        const SizedBox(height: 6),
        Text(
          likes!,
          style: AppTextStyle.textWhiteS13,
        ),
      ],
    );
  }

  Widget buildProfile() {
    return SizedBox(
      height: 48,
      width: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.network(
          profileImg!,
          // fit: BoxFit.contain,
        ),
      ),
    );
  }
}
