import 'package:flutter/material.dart';
import 'package:tiktok_fake/common/app_colors.dart';

class LeftPanel extends StatelessWidget {
  final String? name;
  final String? caption;
  final String? songName;
  const LeftPanel({
    Key? key,
    required this.size,
    this.name,
    this.caption,
    this.songName,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name ?? '',
            style: const TextStyle(
                color: AppColors.whiteAuth,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            caption ?? '',
            style: const TextStyle(color: AppColors.whiteAuth),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.music_note,
                color: AppColors.whiteAuth,
                size: 15,
              ),
              Flexible(
                child: Text(
                  songName ?? '',
                  style:
                      const TextStyle(color: AppColors.whiteAuth, height: 1.5),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
