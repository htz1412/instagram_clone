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
  List<Post> _feedPosts = [];
  List<User> _feedPostUsers = [];

  @override
  void initState() {
    super.initState();
    _setupFeedPosts();
  }

  void _setupFeedPosts() async {
    final postProvider = Provider.of<PostProvider>(context,listen: false);
    _feedPosts = postProvider.feedPosts;
    _feedPostUsers = postProvider.feedPostUsers;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
              (ctx, i) {
                String id = _feedPosts[i].authorId;
                User user = _feedPostUsers.singleWhere((user) => user.userId == id);
                return Posts(
                  post: _feedPosts[i],
                  user: user,
                  currentUserId: widget.currentUserId,
                );
              },
              childCount: _feedPosts.length,
            ),
          ),
        ],
      ),
    );
  }
}
