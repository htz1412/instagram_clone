import 'package:flutter/material.dart';
import 'package:instagram_redesign/model/post.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/provider/post_provider.dart';
import 'package:instagram_redesign/widgets/posts.dart';
import 'package:instagram_redesign/widgets/story.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  final String currentUserId;

  const HomeScreen({this.currentUserId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final PostProvider postProvider = Provider.of<PostProvider>(context);
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                Post post = postProvider.feedPosts[i];
                User user =
                    postProvider.feedPostUsers.firstWhere((user) => user.userId == post.authorId);

                return Posts(
                  post: post,
                  user: user,
                  currentUserId: widget.currentUserId,
                );
              },
              childCount: postProvider.feedPosts.length,
            ),
          ),
        ],
      ),
    );
  }
}
