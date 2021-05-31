import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/model/current_user.dart';
import 'package:instagram_redesign/model/post.dart';
import 'package:instagram_redesign/model/user.dart' as UserModel;
import 'package:instagram_redesign/services/auth_services.dart';
import 'package:instagram_redesign/services/database_services.dart';
import 'package:instagram_redesign/widgets/profile_container.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile_screen';
  final String currentUserId;
  final String userId;

  const ProfileScreen({this.currentUserId, this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  UserModel.User _user;
  bool _isFollowing = false;
  int _followersCount = 0;
  int _followingCount = 0;
  List<Post> _userPosts = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _setupFollowingCount();
    _setupFollowersCount();
    if (widget.userId != widget.currentUserId) {
      _setupIsFollowing();
    }
    _setupUserPosts();
    _fetchUserFromDoc();
    // _test();
  }

  void _fetchUserFromDoc() async {
    UserModel.User user = await DatabaseServices.fetchUser(widget.userId);
    setState(() {
      _user = user;
    });
  }

  void _setupIsFollowing() async {
    bool isFollowing = await DatabaseServices.isFollowing(
      currentUserId: widget.currentUserId,
      userId: widget.userId,
    );

    setState(() {
      _isFollowing = isFollowing;
    });
  }

  void _setupFollowingCount() async {
    int followingCount = await DatabaseServices.followingCount(userId: widget.userId);

    setState(() {
      _followingCount = followingCount;
    });
  }

  void _setupFollowersCount() async {
    int followersCount = await DatabaseServices.followersCount(userId: widget.userId);

    setState(() {
      _followersCount = followersCount;
    });
  }

  void _setupUserPosts() async {
    final List<Post> posts = await DatabaseServices.fetchUserPosts(userId: widget.userId);
    setState(() {
      _userPosts = posts;
    });
  }

  void _followOrUnfollow() async {
    if (_isFollowing) {
      _unfollowUser();
    } else {
      _followUser();
    }
  }

  void _followUser() {
    DatabaseServices.followUser(
      context: context,
      currentUserId: widget.currentUserId,
      userId: widget.userId,
    );
    setState(() {
      _isFollowing = true;
      _followersCount++;
    });
  }

  void _unfollowUser() {
    DatabaseServices.unfollowUser(
      context: context,
      currentUserId: widget.currentUserId,
      userId: widget.userId,
    );
    setState(() {
      _isFollowing = false;
      _followersCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Color(0xfffffefe),
        appBar: AppBar(
          backgroundColor: Color(0xfffffefe),
          elevation: 0.5,
          title: Row(
            children: [
              Icon(
                Icons.lock_outline_rounded,
                color: Color(0xff262626),
              ),
              SizedBox(width: 2),
              Text(
                _user.userName,
                textScaleFactor: 1,
                style: TextStyle(
                  color: Color(0xff262626),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.expand_more_outlined,
                color: Color(0xff262626),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Color(
                  0xff262626,
                ),
              ),
              visualDensity: VisualDensity.compact,
              splashRadius: 20,
              onPressed: () {
                AuthServices.logout();
              },
            ),
            SizedBox(width: 8),
          ],
        ),
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (ctx, _) {
              return [
                profileHeader(),
                editProfileButton(context: context),
              ];
            },
            body: postGrid(),
          ),
        ),
      );
    }
  }

  Widget profileHeader() {
    return SliverToBoxAdapter(
      child: Container(
        color: Color(0xfffffefe),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                ProfileContainer(
                  user: _user,
                  radius: 40,
                  hasUserStory: false,
                ),
                SizedBox(height: 4),
                Text(
                  _user.userName,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff262626),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '${_userPosts.length}',
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff262626),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Posts',
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff262626),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '$_followersCount',
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff262626),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Followers',
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff262626),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '$_followingCount',
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff262626),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Following',
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff262626),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _editProfile() {}

  Widget editProfileButton({BuildContext context}) {
    final currentUserId = Provider.of<CurrentUser>(context).currentUserId;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      sliver: SliverToBoxAdapter(
        child: _user.userId == currentUserId
            ? ElevatedButton(
                onPressed: _editProfile,
                style: ElevatedButton.styleFrom(
                  onPrimary: Color(0xff262626),
                  primary: Color(0xfffffefe),
                  elevation: 0,
                  alignment: Alignment.center,
                  side: BorderSide(
                    color: Color(0xffdcdcdc),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  'Edit Profile',
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Color(0xff262626),
                      ),
                ),
              )
            : ElevatedButton(
                onPressed: _followOrUnfollow,
                style: ElevatedButton.styleFrom(
                  onPrimary: _isFollowing ? Color(0xff262626) : Colors.white,
                  primary: _isFollowing ? Color(0xfffffefe) : Colors.blue,
                  elevation: 0,
                  alignment: Alignment.center,
                  side: _isFollowing
                      ? BorderSide(
                          color: Color(0xffdcdcdc),
                        )
                      : BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  _isFollowing ? 'Unfollow' : 'Follow',
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: _isFollowing ? Color(0xff262626) : Colors.white,
                      ),
                ),
              ),
      ),
    );
  }

  Widget postGrid() {
    final Color selectedTabColor = Color(0xff262626);
    final Color unSelectedTabColor = Color(0xff999999);

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: AppBar(
            elevation: 0,
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.4),
            ),
            backgroundColor: Color(0xfffffefe),
            bottom: TabBar(
              onTap: (index) {
                setState(() {});
              },
              controller: _tabController,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.table_chart_outlined,
                    color: _tabController.index == 0 ? selectedTabColor : unSelectedTabColor,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/images/instagram-reels.png',
                    width: 22,
                    height: 22,
                    color: _tabController.index == 1 ? selectedTabColor : unSelectedTabColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              StaggeredGridView.countBuilder(
                padding: const EdgeInsets.only(top: 2),
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemBuilder: (ctx, index) {
                  return Container(
                    color: Colors.grey[200],
                    child: CachedNetworkImage(
                      imageUrl: _userPosts[index].postUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: _userPosts.length,
                staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  itemBuilder: (ctx, index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          child: Image.network(
                            postsData[index].postUrl,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        Positioned(
                          child: Text(
                            '100 views',
                            textScaleFactor: 1,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          left: 14,
                          bottom: 8,
                        ),
                        Positioned(
                          child: Text(
                            'This is your reels',
                            textScaleFactor: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          bottom: 24,
                          left: 14,
                          right: 14,
                        ),
                      ],
                    );
                  },
                  itemCount: postsData.length,
                  staggeredTileBuilder: (index) => StaggeredTile.extent(1, 280),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
