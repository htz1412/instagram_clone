import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_redesign/utilities/constants.dart';

class MessageContainer extends StatelessWidget {
  final String postId;
  MessageContainer({this.postId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: commentsRef
          .doc(postId)
          .collection('userComments')
          .orderBy('timeStamp', descending: true)
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final data = snapshot.data.docs;

        return ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                data[index]['message'],
                style: TextStyle(
                  color: Color(0xff262626),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
          itemCount: data.length,
        );
      },
    );
  }
}
