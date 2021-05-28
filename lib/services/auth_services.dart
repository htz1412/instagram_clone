import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class AuthServices {
  static final _auth = FirebaseAuth.instance;
  static final _instance = FirebaseFirestore.instance;
  static final _storage = FirebaseStorage.instance;

  static Future<void> signUpUser({
    BuildContext context,
    String userName,
    String email,
    String password,
    File profileImage,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userId = userCredential.user.uid;

      Reference ref = _storage.ref().child('user_profile_images').child(userId + '.jpg');

      await ref.putFile(profileImage);

      final profileImageUrl = await ref.getDownloadURL();

      await _instance.collection('users').doc(userId).set({
        'userName': userName,
        'email': email,
        'profileUrl': profileImageUrl,
        'bio': '',
      });
      Navigator.pop(context);
    } catch (error) {
      print(error.toString());
    }
  }

  static Future<void> loginUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static void logout() {
    _auth.signOut();
  }
}
