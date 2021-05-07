import 'package:flutter/material.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/widgets/posts.dart';
import 'package:instagram_redesign/widgets/story.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 1,
            leading: IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
                size: 26,
              ),
              onPressed: () {},
            ),
            title: Text(
              'Instagram',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Billabong',
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  MdiIcons.facebookMessenger,
                  color: Colors.black,
                  size: 26,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Story(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, i) {
                return Posts(
                  post: postsData[i],
                );
              },
              childCount: postsData.length,
            ),
          ),
        ],
      ),
    );
  }
}
