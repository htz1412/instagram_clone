import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/provider/post_provider.dart';
import 'package:instagram_redesign/screens/notification_screen.dart';
import 'package:instagram_redesign/screens/home_screen.dart';
import 'package:instagram_redesign/screens/profile_screen.dart';
import 'package:instagram_redesign/screens/add_post_screen.dart';
import 'package:instagram_redesign/screens/search_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedIndex = 0;
  bool _isFetching = false;

  List<Map<String, Object>> _pages = [
    {
      'title': 'home',
      'page': HomeScreen(currentUserId: FirebaseAuth.instance.currentUser.uid),
    },
    {
      'title': 'search',
      'page': SearchScreen(
        currentUserId: FirebaseAuth.instance.currentUser.uid,
      ),
    },
    {
      'title': 'follow',
      'page': FollowScreen(),
    },
    {
      'title': 'profile',
      'page': ProfileScreen(
        currentUserId: FirebaseAuth.instance.currentUser.uid,
        userId: FirebaseAuth.instance.currentUser.uid,
      ),
    }
  ];

  @override
  void initState() {
    super.initState();
    _setupFeedPosts();
  }

  void _setupFeedPosts() async {
    setState(() {
      _isFetching = true;
    });

    await Provider.of<PostProvider>(
      context,
      listen: false,
    ).fetchAndSetFeedPosts(currentUserId: FirebaseAuth.instance.currentUser.uid);

    setState(() {
      _isFetching = false;
    });
  }

  void _selectPage(int currentIndex) {
    if (currentIndex == 2) {
      Navigator.of(context).pushNamed(AddPostScreen.routeName);
    } else {
      setState(() {
        _selectedIndex = currentIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isFetching) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      return DefaultTabController(
        length: _pages.length + 1,
        child: Scaffold(
          backgroundColor: Color(0xfffffefe),
          body: _selectedIndex < 2
              ? _pages[_selectedIndex]['page']
              : _pages[_selectedIndex - 1]['page'],
          bottomNavigationBar: SizedBox(
            height: 50,
            child: BottomNavigationBar(
              backgroundColor: Color(0xfffffefe),
              elevation: 5,
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 0,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    MdiIcons.home,
                    size: 28,
                  ),
                  icon: Icon(
                    MdiIcons.homeOutline,
                    size: 28,
                  ),
                  tooltip: 'Home',
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_outlined,
                    size: 28,
                  ),
                  tooltip: 'Search',
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_box_outlined,
                    size: 28,
                  ),
                  tooltip: 'Add Post',
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    MdiIcons.heart,
                    size: 28,
                  ),
                  icon: Icon(
                    MdiIcons.heartOutline,
                    size: 28,
                  ),
                  tooltip: 'Notification',
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      currentUser.profileUrl,
                    ),
                    radius: 15,
                  ),
                  tooltip: 'Profile',
                  label: '',
                ),
              ],
              onTap: _selectPage,
            ),
          ),
        ),
      );
    }
  }
}
