import 'package:flutter/material.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/utilities/constants.dart';

class CommentInput extends StatefulWidget {
  final String postId;
  final User currentUser;

  const CommentInput({this.postId, this.currentUser});

  @override
  _CommentInputState createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    final String message = _messageController.text;

    setState(() {
      _messageController.clear();
    });

    await commentsRef.doc(widget.postId).set({});
    await commentsRef.doc(widget.postId).collection('userComments').add({
      'userId': widget.currentUser.userId,
      'message': message,
      'timeStamp': DateTime.now(),
      'profileUrl': widget.currentUser.profileUrl,
      'userName': widget.currentUser.userName,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: _messageController,
              style: TextStyle(
                color: Color(0xff262626),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            iconSize: 26,
            onPressed: _sendMessage,
            splashRadius: 30,
            icon: Icon(
              Icons.send_rounded,
              color: Color(0xfffffefe),
            ),
            // color: Colors.blue,
          ),
        ),
        // GestureDetector(
        //   onTap: _messageController.text.trim().isEmpty ? null : _sendMessage,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.blue,
        //     radius: 25,
        //     child: Icon(
        //       Icons.send_rounded,
        //       color: Color(0xfffffefe),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
