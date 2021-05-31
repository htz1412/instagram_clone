import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_redesign/model/post.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/screens/profile_screen.dart';
import 'package:instagram_redesign/services/database_services.dart';
import 'package:instagram_redesign/widgets/profile_container.dart';

class Posts extends StatefulWidget {
  final Post post;
  final User user;
  final String currentUserId;

  const Posts({this.post, this.user, this.currentUserId});

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var _isLiked = false;

  @override
  void initState() {
    super.initState();
    _setupIsLike();
  }

  void _setupIsLike() async {
    DocumentSnapshot<Map<String, dynamic>> likeDoc = await DatabaseServices.isPostLiked(
      currentUserId: widget.currentUserId,
      post: widget.post,
      postId: widget.post.postId,
    );

    if (likeDoc.exists) {
      setState(() {
        _isLiked = !_isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffffefe),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                ProfileContainer(
                  user: widget.user,
                  radius: 14,
                  hasUserStory: true,
                  margin: const EdgeInsets.symmetric(horizontal: 6.0),
                ),
                SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileScreen(
                          currentUserId: widget.currentUserId,
                          userId: widget.user.userId,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.userName,
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.15,
                          fontSize: 13.8,
                          color: Color(0xff262626),
                        ),
                      ),
                      widget.post.location == ''
                          ? SizedBox.shrink()
                          : Text(
                              widget.post.location,
                              textScaleFactor: 1,
                              style: Theme.of(context).textTheme.subtitle2.copyWith(
                                    fontSize: 12,
                                    color: Color(0xff262626),
                                  ),
                            ),
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Color(0xff262626),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 350,
              maxHeight: 420,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
                width: 0.4,
                color: ThemeData().dividerColor,
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: widget.post.postUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        _isLiked
                            ? 'assets/images/love_active_icon.svg'
                            : 'assets/images/love_icon.svg',
                        width: 22,
                        color: _isLiked ? Colors.red[600]: Color(0xff262626),
                      ),
                      onPressed: () {
                        _isLiked
                            ? DatabaseServices.disLikePost(
                                currentUserId: widget.currentUserId,
                                post: widget.post,
                                postId: widget.post.postId,
                              )
                            : DatabaseServices.likePost(
                                currentUserId: widget.currentUserId,
                                post: widget.post,
                                postId: widget.post.postId,
                              );
                        setState(() {
                          _isLiked = !_isLiked;
                        });
                      },
                      visualDensity: VisualDensity.compact,
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/comment_icon.svg',
                        width: 22,
                        color: Color(0xff262626),
                      ),
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/message_icon.svg',
                        width: 26,
                        color: Color(0xff262626),
                      ),
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.bookmark_border_outlined,
                    size: 28,
                    color: Color(0xff262626),
                  ),
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '${widget.post.likes} likes',
              textScaleFactor: 1,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xff262626),
                fontSize: 13.8,
              ),
            ),
          ),
          SizedBox(height: 4),
          widget.post.caption.isEmpty
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: TextStyle(fontFamily: 'SFDisplay'),
                      children: [
                        TextSpan(
                          text: '${widget.user.userName}\t',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff262626),
                            fontSize: 13.8,
                          ),
                        ),
                        TextSpan(
                          text: '${widget.post.caption}',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                                fontSize: 13.5,
                                letterSpacing: 0.25,
                                color: Color(0xff262626),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              child: Text(
                'View all 100 comments',
                textScaleFactor: 1,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Color(0xff999999),
                      fontSize: 13.8,
                    ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '1 hour ago',
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Color(0xff999999),
                    fontSize: 11.5,
                  ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
