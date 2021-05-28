import 'package:flutter/material.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/widgets/profile_container.dart';

class FollowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Color(0xfffffefe),
            brightness: Brightness.dark,
            pinned: true,
            title: Text(
              'Activity',
              textScaleFactor: 1,
              style: TextStyle(
                letterSpacing: -0.1,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          ProfileContainer(
                            radius: 26,
                            user: dummyUser,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 34,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                child: Text(
                                  '50',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Follow Requests',
                              textScaleFactor: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.1,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Approve or ignnore requests',
                              textScaleFactor: 1,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
