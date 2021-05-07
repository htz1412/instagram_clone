import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/screens/notification_screen.dart';
import 'package:instagram_redesign/screens/home_screen.dart';
import 'package:instagram_redesign/screens/profile_screen.dart';
import 'package:instagram_redesign/screens/reels_screen.dart';
import 'package:instagram_redesign/screens/search_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedIndex = 0;
  List<Map<String, Object>> _pages = [
    {
      'title': 'home',
      'page': HomeScreen(),
    },
    {
      'title': 'search',
      'page': SearchScreen(),
    },
    {
      'title': 'reels',
      'page': ReelsScreen(),
    },
    {
      'title': 'follow',
      'page': FollowScreen(),
    },
    {
      'title': 'profile',
      'page': ProfileScreen(),
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  void _selectPage(int currentIndex) {
    setState(() {
      _selectedIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _selectedIndex == _pages.length - 1 ? profileAppBar() : null,
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 4,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey[800],
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.home,
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
              icon: Image.asset(
                'assets/images/instagram-reels.png',
                width: 22,
                height: 22,
              ),
              tooltip: 'Reels',
              label: '',
            ),
            BottomNavigationBarItem(
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
    );
  }
}
