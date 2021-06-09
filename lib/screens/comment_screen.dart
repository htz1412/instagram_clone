import 'package:flutter/material.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/widgets/comment_input.dart';
import 'package:instagram_redesign/widgets/message_container.dart';

class CommentScreen extends StatefulWidget {
  final User currentUser;
  final String postId;
  const CommentScreen({this.currentUser, this.postId});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
          style: TextStyle(
            color: Color(0xff262626),
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfffffefe),
        elevation: 0,
      ),
      backgroundColor: Color(0xfffffefe),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                child: MessageContainer(postId: widget.postId),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: CommentInput(
                postId: widget.postId,
                currentUser: currentUser,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
