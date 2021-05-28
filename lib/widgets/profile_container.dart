import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_redesign/model/user.dart';

class ProfileContainer extends StatelessWidget {
  final User user;
  final double radius;
  final bool hasUserStory;
  final EdgeInsetsGeometry margin;

  ProfileContainer({
    this.user,
    this.radius,
    this.hasUserStory = false,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.3),
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(
          color: hasUserStory ? Colors.red : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(radius + 4),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.4,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(user.profileUrl),
          radius: radius,
          backgroundColor: Colors.grey[300],
        ),
      ),
    );
  }
}
