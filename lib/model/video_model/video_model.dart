import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  String? id;
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
  Timestamp? dateCreated;

  VideoModel(
    this.id,
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
    this.dateCreated,
  );

  VideoModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.id;
    final data = documentSnapshot.data() as Map<String, dynamic>;
    videoUrl = data["video_url"];
    name = data["name"];
    dateCreated = data["dateCreated"];
    songName = data["song_name"];
    profileImg = data["profile_img"];
    likes = data["likes"];
    shares = data["shares"];
    comments = data["comments"];
    albumImg = data["album_img"];
    bookMark = data["book_mark"];
    dateCreated = data["date_created"];
  }
}
