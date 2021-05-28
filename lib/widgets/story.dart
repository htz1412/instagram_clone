import 'package:flutter/material.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/widgets/profile_container.dart';

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 105,
          color: Color(0xfffffefe),
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
                              margin: const EdgeInsets.only(
                                left: 12.0,
                                right: 8,
                              ),
                            ),
                            Positioned(
                              bottom: 4,
                              right: 12,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
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
                  SizedBox(height: 6),
                  SizedBox(
                    width: 70,
                    child: Text(
                      index == 0 ? 'Your Story' : stories[index - 1].userName,
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            fontSize: 12.5,
                          ),
                      // style: TextStyle(
                      //   fontWeight: FontWeight.w500,
                      //   fontSize: 12,
                      //   letterSpacing: -0.2,
                      //   color: Color(0xff1d1d1f),
                      // ),
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
