import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/utilities/constants.dart';

class MessageContainer extends StatelessWidget {
  final String postId;
  final User currentUser;
  MessageContainer({this.postId, this.currentUser});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: commentsRef
          .doc(postId)
          .collection('userComments')
          .orderBy('timeStamp', descending: false)
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey[300],
              strokeWidth: 2,
            ),
          );
        }

        final data = snapshot.data.docs;

        if (data.length == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mode_comment_outlined,
                  size: 100,
                  color: Colors.grey[350],
                ),
                Text(
                  'No comments yet.',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(data[index]['profileUrl']),
                    radius: 20,
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]['userName'],
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          data[index]['message'],
                          style: TextStyle(
                            color: Color(0xff212121),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: data.length,
        );
      },
    );
  }
}
