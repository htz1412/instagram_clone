import 'package:flutter/material.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/widgets/profile_container.dart';

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: Colors.white,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  index == 0
                      ? Stack(
                        children: [
                          ProfileContainer(
                            user: currentUser,
                            radius: 32,
                            hasUserStory: false,
                            margin: const EdgeInsets.symmetric(horizontal: 6.0),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 6,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          )
                        ],
                      )
                      : ProfileContainer(
                        user: stories[index - 1],
                        radius: 32,
                        hasUserStory: true,
                        margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      ),
                  SizedBox(height: 2),
                  SizedBox(
                    width: 70,
                    child: Text(
                      index == 0 ? 'Your Story' : stories[index - 1].userName,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: stories.length + 1,
          ),
        ),
        Divider(
          height: 6,
        ),
      ],
    );
  }
}
