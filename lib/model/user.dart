import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userId;
  final String userName;
  final String email;
  final String profileUrl;
  final String bio;

  User({
    this.userId,
    this.userName,
    this.email,
    this.profileUrl,
    this.bio,
  });

  factory User.fromDoc(DocumentSnapshot<Map<String, Object>> doc) {
    return User(
      userId: doc.id,
      userName: doc['userName'],
      email: doc['email'],
      profileUrl: doc['profileUrl'],
      bio: doc['bio'] ?? '',
    );
  }
}
