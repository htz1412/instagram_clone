import 'package:flutter/material.dart';
import 'package:instagram_redesign/model/current_user.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/utilities/constants.dart';
import 'package:instagram_redesign/widgets/comment_input.dart';
import 'package:instagram_redesign/widgets/message_container.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  final String postId;
  const CommentScreen({this.postId});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  User currentUser;

  @override
  void initState() {
    _fetchCurrentUser();
    super.initState();
  }

  void _fetchCurrentUser() async {
    var userDoc =
        await usersRef.doc(Provider.of<CurrentUser>(context, listen: false).currentUserId).get();

    setState(() {
      currentUser = User.fromDoc(userDoc);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.grey[300],
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }
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
                child: MessageContainer(
                  postId: widget.postId,
                  currentUser: currentUser,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
