import 'package:get/get.dart';
import 'package:note_app/controller/auth_controller.dart';
import 'package:note_app/db/db.dart';
import 'package:note_app/model/note_model.dart';

class NoteController extends GetxController {
  late List<NoteModel> noteList = [];

  @override
  onInit() async {
    super.onInit();
    String uid = Get.find<AuthController>().user!.uid;
    noteList = await Database().getListNote(uid);
    print('dang load list note');
  }

  void createNote(NoteModel note, String uid) async {
    String link = '';
    try {
      if (note.imgUrl != '') {
        link = await uploadImage(note.imgUrl!);
        print('this link ${link}');
      }
      await Database().addNote(
          note.content ?? '', uid, note.title ?? '', note.dateCreated!, link);
    } catch (firebaseAuthException) {}
    await getListNote(uid);
    update();
  }

  deleteNote(String id, uid) async {
    try {
      await Database().deleteNote(id, uid);
    } catch (firebaseAuthException) {}
    await getListNote(uid);
    update();
  }

  updateNote(String id, String uid, String content, String tittle,
      String imgUrl) async {
    String link = '';
    try {
      if (imgUrl != '') {
        link = await uploadImage(imgUrl);
        print('this link ${link}');
      }
      await Database().updateNote(id, uid, tittle, content, link);
    } catch (firebaseAuthException) {
      print('bugg');
    }
    await getListNote(uid);
    update();
  }

  uploadImage(String path) async {
    try {
      String url = await Database().uploadImg(path);
      return url;
    } catch (firebaseAuthException) {
      print('bugg');
    }
    // update();
  }

  Future<void> getListNote(String uid) async {
    noteList = await Database().getListNote(uid);
  }
}
