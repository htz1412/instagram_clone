import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/model/post.dart';
import 'package:instagram_redesign/widgets/profile_container.dart';

class Posts extends StatelessWidget {
  final Post post;

  const Posts({this.post});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            children: [
              ProfileContainer(
                user: stories.firstWhere(
                  (user) => user.userName == post.userName,
                ),
                radius: 14,
                hasUserStory: true,
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
              ),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    post.location,
                    style: TextStyle(
                      fontSize: 13,
                      // fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey[800],
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
          child: Image.network(
            post.postUrl,
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
                      'assets/images/love_icon.svg',
                      width: 22,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                    visualDensity: VisualDensity.compact,
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/comment_icon.svg',
                      width: 22,
                      color: Colors.black,
                    ),
                    visualDensity: VisualDensity.compact,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/message_icon.svg',
                      width: 26,
                      color: Colors.black,
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
            '${post.likes} likes',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                '${post.userName}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 6),
              Text(
                '${post.caption}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
            child: Text(
              'View all 100 comments',
              style: TextStyle(
                color: Colors.grey[500],
                // fontSize: 12,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '20 minutes ago',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 10,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
