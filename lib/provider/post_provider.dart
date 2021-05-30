import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_redesign/model/post.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/services/database_services.dart';

class PostProvider with ChangeNotifier {
  List<Post> _feedPosts = [];
  List<User> _feedPostUsers = [];

  List<Post> get feedPosts {
    return [..._feedPosts];
  }

  List<User> get feedPostUsers {
    return [..._feedPostUsers];
  }

  Future<void> fetchAndSetFeedPosts({String currentUserId}) async {
    final List<Post> posts = await DatabaseServices.fetchFeedPosts(currentUserId: currentUserId);

    if (posts.length > 0) {
      final List<String> usersList = [];
      posts.map((post) => usersList.add(post.authorId)).toList();

      final List<User> users = await DatabaseServices.fetchFeedPostUsers(listOfUser: usersList);
      _feedPosts = posts;
      _feedPostUsers = users;
      notifyListeners();
    }
  }
}
