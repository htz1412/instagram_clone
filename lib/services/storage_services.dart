import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_redesign/utilities/constants.dart';
import 'package:uuid/uuid.dart';

class StorageServices {
  static Future<String> uploadPost(File imageFile) async {
    String postId = Uuid().v4();
    Reference ref = storageRef.child('posts').child(postId + '.jpg');
    await ref.putFile(imageFile);
    return ref.getDownloadURL();
  }
}
