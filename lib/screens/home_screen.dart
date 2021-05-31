import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_redesign/model/post.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/services/database_services.dart';
import 'package:instagram_redesign/utilities/constants.dart';
import 'package:instagram_redesign/widgets/posts.dart';
import 'package:instagram_redesign/widgets/story.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  final String currentUserId;

  const HomeScreen({this.currentUserId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _followingIds = [];
  final List<User> _feedPostUsers = [];

  Future<void> fetchData() async {
    final QuerySnapshot<Map<String, dynamic>> idDocs =
        await usersRef.doc(widget.currentUserId).collection('following').get();

    idDocs.docs.forEach((doc) {
      _followingIds.add(doc.id);
    });

    final QuerySnapshot<Map<String, dynamic>> users = await usersRef.get();

    users.docs.forEach((userDoc) {
      if (_followingIds.contains(userDoc.id)) {
        _feedPostUsers.add(User.fromDoc(userDoc));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: Color(0xfffffefe),
            elevation: 0.5,
            leading: IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Color(0xff262626),
                size: 26,
              ),
              onPressed: () {},
            ),
            title: Text(
              'Instagram',
              style: TextStyle(
                color: Color(0xff262626),
                fontSize: 40,
                fontFamily: 'Billabong',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Story(),
          ),
          FutureBuilder(
            future: fetchData(),
            builder: (ctx, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey[300],
                      strokeWidth: 2,
                    ),
                  ),
                );
              }

              return StreamBuilder(
                  stream: postsRef.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SliverToBoxAdapter();
                    }
                    final List<Post> posts = [];
                    snapshot.data.docs.forEach((postDoc) {
                      if (_followingIds.contains(postDoc['authorId'])) {
                        posts.add(Post.fromDoc(postDoc));
                      }
                    });

                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) {
                          var index = _followingIds.indexOf(posts[i].authorId);

                          return Posts(
                            post: posts[i],
                            user: _feedPostUsers[index],
                            currentUserId: widget.currentUserId,
                          );
                        },
                        childCount: posts.length,
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
