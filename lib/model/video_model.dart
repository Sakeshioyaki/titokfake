class VideoModel {
  String? videoUrl;
  String? name;
  String? caption;
  String? songName;
  String? profileImg;
  String? likes;
  String? comments;
  String? shares;
  String? albumImg;
  String? bookMark;

  VideoModel(
    this.name,
    this.caption,
    this.songName,
    this.profileImg,
    this.likes,
    this.comments,
    this.shares,
    this.albumImg,
    this.videoUrl,
    this.bookMark,
  );
}
