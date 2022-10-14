import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';

class RightPanel extends StatelessWidget {
  final String? likes;
  final String? comments;
  final String? shares;
  final String? profileImg;
  final String? albumImg;
  const RightPanel({
    Key? key,
    required this.size,
    this.likes,
    this.comments,
    this.shares,
    this.profileImg,
    this.albumImg,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildProfile(),
                const SizedBox(height: 34),
                buildLikes(),
                const SizedBox(height: 23),
                buildComments(),
                const SizedBox(height: 23),
                buildShare(),
                const SizedBox(height: 30),
                buildMusicAlbum()
              ],
            ))
          ],
        ),
      ),
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
