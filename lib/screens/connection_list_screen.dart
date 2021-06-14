import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_redesign/model/user.dart';
import 'package:instagram_redesign/utilities/constants.dart';

class ConnectionListScreen extends StatefulWidget {
  final int connectinoId;
  final String userId;
  const ConnectionListScreen({this.connectinoId, this.userId});

  @override
  _ConnectionListScreenState createState() => _ConnectionListScreenState();
}

class _ConnectionListScreenState extends State<ConnectionListScreen> {
  List<User> users = [];

  Future<void> _fetchConnectinos() async {
    String collectionName = widget.connectinoId == 0 ? 'followers' : 'following';
    final List<String> userIds = [];
    var userIdsDoc = await usersRef.doc(widget.userId).collection(collectionName).get();
    userIdsDoc.docs.forEach((doc) {
      userIds.add(doc.id);
    });

    var usersDoc = await usersRef.get();
    var snapList = usersDoc.docs.where((element) => userIds.contains(element.id)).toList();
    users = snapList.map((e) => User.fromDoc(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffefe),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xfffffefe),
              title: Text(
                widget.connectinoId == 0 ? 'Followers' : 'Following',
                style: TextStyle(
                  color: Color(0xff262626),
                  fontSize: 22,
                ),
              ),
              centerTitle: true,
            ),
            FutureBuilder(
              future: _fetchConnectinos(),
              builder: (ctx, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, index) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4,horizontal: 14),
                      title: Text(
                        users[index].userName,
                        style: TextStyle(
                          color: Color(0xff262626),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundImage: CachedNetworkImageProvider(users[index].profileUrl),
                      ),
                    ),
                    childCount: users.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
