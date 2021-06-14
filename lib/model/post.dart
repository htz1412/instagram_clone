import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postId;
  final String authorId;
  final String location;
  final String postUrl;
  final int likes;
  final String caption;
  final DateTime timeStamp;

  Post({
    this.postId,
    this.authorId,
    this.location,
    this.postUrl,
    this.likes,
    this.caption,
    this.timeStamp,
  });

  factory Post.fromDoc(DocumentSnapshot doc) {
    return Post(
      postId: doc.id,
      authorId: doc['authorId'],
      location: doc['location'],
      postUrl: doc['postUrl'],
      likes: doc['likes'],
      caption: doc['caption'],
      timeStamp: doc['timeStamp'].toDate(),
    );
  }
}
