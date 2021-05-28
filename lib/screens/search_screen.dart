import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_redesign/model/post.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/screens/profile_screen.dart';
import 'package:instagram_redesign/services/database_services.dart';
import 'package:instagram_redesign/utilities/constants.dart';

class SearchScreen extends StatefulWidget {
  final String currentUserId;

  const SearchScreen({this.currentUserId});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<User> _allUsers = [];
  List<User> _foundedResults = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchAllUsers();
  }

  void _fetchAllUsers() async {
    setState(() {
      _isLoading = true;
    });
    final List<User> users = await DatabaseServices.fetchAllUsers();
    setState(() {
      _allUsers = users;
      _isLoading = false;
    });
  }

  void _searchResult(String searchText) {
    List<User> results = [];
    if (searchText.isNotEmpty) {
      results = _allUsers.where((user) {
        if (user.userId != widget.currentUserId &&
            user.userName.toLowerCase().startsWith(searchText.toLowerCase())) {
          return true;
        }
        return false;
      }).toList();
    }

    setState(() {
      _foundedResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xfffffefe),
              floating: true,
              titleSpacing: 0,
              title: Container(
                height: 35,
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (text) => _searchResult(text),
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.grey[700],
                  cursorWidth: 1.5,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.1,
                      color: Colors.black26,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            _foundedResults.length > 0
                ? SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (ctx, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProfileScreen(
                                        currentUserId: widget.currentUserId,
                                        userId: _foundedResults[index].userId,
                                      ),
                                    ),
                                  );
                                },
                                leading: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                    _foundedResults[index].profileUrl,
                                  ),
                                  radius: 30,
                                ),
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  _foundedResults[index].userName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff262626),
                                  ),
                                ),
                              ),
                              Divider(),
                            ],
                          );
                        },
                        childCount: _foundedResults.length,
                      ),
                    ),
                  )
                : StreamBuilder(
                    stream: postsRef.orderBy('timeStamp', descending: false).snapshots(),
                    builder: (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final List<Post> posts =
                          snapshot.data.docs.map((post) => Post.fromDoc(post)).toList();
                      return SliverFillRemaining(
                        child: StaggeredGridView.countBuilder(
                          // shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          crossAxisCount: 3,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (ctx, index) {
                            return ClipRRect(
                              child: CachedNetworkImage(
                                imageUrl: posts[index].postUrl,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          itemCount: posts.length,
                          staggeredTileBuilder: (index) => StaggeredTile.count(
                            index % 9 == 0
                                ? index == 0
                                    ? 1
                                    : 2
                                : index == 1
                                    ? 2
                                    : 1,
                            index % 9 == 0
                                ? index == 0
                                    ? 1
                                    : 2
                                : index == 1
                                    ? 2
                                    : 1,
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      );
    }
  }
}
