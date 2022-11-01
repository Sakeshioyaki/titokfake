import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:tiktok_fake/model/user_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();
  // final imagesRef = storageRef.child("images");

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      print('dang tao userController - va add user vo database - ${user.id}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addVideo(String content, String uid, String title,
      Timestamp dateCreated, String imgUrl) async {
    try {
      await _firestore.collection("users").doc(uid).collection("notes").add({
        'dateCreated': dateCreated,
        'content': content,
        'title': title,
        'imgUrl': imgUrl,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<String> uploadImg(String filePath) async {
    String instanceName = "/images/${basename(filePath)}";
    final imagesRef = storageRef.child(instanceName);
    File file = File(filePath);

    print('dang upload file - $filePath');

    try {
      final uploadTask = await imagesRef.putFile(file);
      var url = await imagesRef.getDownloadURL();
      print('dang upload file - $url');
      print('--- ${uploadTask.state}');
      return url;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
