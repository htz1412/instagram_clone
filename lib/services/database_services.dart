import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_redesign/model/post.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/provider/post_provider.dart';
import 'package:provider/provider.dart';

import '../utilities/constants.dart';

class DatabaseServices {
  static Future<User> fetchUser(String userId) async {
    try {
      final userDoc = await usersRef.doc(userId).get();
      final User user = User.fromDoc(userDoc);
      return user;
    } catch (error) {
      print(error.toString());
    }
    return User();
  }

  static Future<List<User>> fetchAllUsers() async {
    final QuerySnapshot<Map<String, dynamic>> usersSnap = await usersRef.get();

    final List<User> users = [];
    usersSnap.docs.map((user) => users.add(User.fromDoc(user))).toList();

    return users;
  }

  static Future<void> createPost({BuildContext context, Post post}) async {
    await postsRef.add(
      {
        'authorId': post.authorId,
        'location': post.location,
        'postUrl': post.postUrl,
        'likes': post.likes,
        'caption': post.caption,
        'timeStamp': post.timeStamp,
      },
    );

    await Provider.of<PostProvider>(context, listen: false)
        .fetchAndSetFeedPosts(currentUserId: post.authorId);
  }

  static Future<List<Post>> fetchUserPosts({String userId}) async {
    final QuerySnapshot<Map<String, dynamic>> postDocs = await postsRef.get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> postQuerySnapshots =
        postDocs.docs.where((post) => post['authorId'] == userId).toList();

    final List<Post> userPosts = postQuerySnapshots.map((post) => Post.fromDoc(post)).toList();

    return userPosts;
  }

  static Future<List<Post>> fetchFeedPosts({String currentUserId}) async {
    final QuerySnapshot<Map<String, dynamic>> followingDocs =
        await usersRef.doc(currentUserId).collection('following').get();

    final List<Post> posts = [];
    if (followingDocs.docs.isNotEmpty) {
      final List<String> followingList = [];
      followingDocs.docs.map((user) => followingList.add(user.id)).toList();

      final QuerySnapshot<Map<String, dynamic>> postsSnap =
          await postsRef.where('authorId', whereIn: followingList).get();

      postsSnap.docs.map((post) {
        posts.add(Post.fromDoc(post));
      }).toList();
    }
    return posts;
  }

  static Future<List<User>> fetchFeedPostUsers({List<String> listOfUser}) async {
    final QuerySnapshot<Map<String, dynamic>> usersSnap = await usersRef.get();

    final List<User> users = [];
    usersSnap.docs.forEach((user) {
      if (listOfUser.contains(user.id)) {
        users.add(User.fromDoc(user));
      }
    });

    return users;
  }

  static void followUser({BuildContext context, String currentUserId, String userId}) async {
    await usersRef.doc(currentUserId).collection('following').doc(userId).set({});

    await usersRef.doc(userId).collection('followers').doc(currentUserId).set({});

    await Provider.of<PostProvider>(context, listen: false)
        .fetchAndSetFeedPosts(currentUserId: currentUserId);
  }

  static void unfollowUser({BuildContext context, String currentUserId, String userId}) async {
    final DocumentSnapshot<Map<String, dynamic>> followingDoc =
        await usersRef.doc(currentUserId).collection('following').doc(userId).get();

    if (followingDoc.exists) {
      await followingDoc.reference.delete();
    }

    final DocumentSnapshot followersDoc =
        await usersRef.doc(userId).collection('followers').doc(currentUserId).get();

    if (followersDoc.exists) {
      await followersDoc.reference.delete();
    }

    await Provider.of<PostProvider>(context, listen: false)
        .fetchAndSetFeedPosts(currentUserId: currentUserId);
  }

  static Future<bool> isFollowing({String currentUserId, String userId}) async {
    final DocumentSnapshot<Map<String, dynamic>> followingDoc =
        await usersRef.doc(currentUserId).collection('following').doc(userId).get();

    return followingDoc.exists;
  }

  static Future<int> followersCount({String userId}) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await usersRef.doc(userId).collection('followers').get();

    return snapshot.docs.length;
  }

  static Future<int> followingCount({String userId}) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await usersRef.doc(userId).collection('following').get();

    return snapshot.docs.length;
  }
}
