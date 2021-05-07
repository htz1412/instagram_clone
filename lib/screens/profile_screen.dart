import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_redesign/data.dart';
import 'package:instagram_redesign/widgets/profile_container.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (ctx, _) {
          return [
            // ProfileAppBar(),
            profileHeader(),
            editProfileButton(),
          ];
        },
        body: ProfileFooter(tabController: _tabController),
      ),
    );
  }
}

class ProfileFooter extends StatelessWidget {
  final TabController tabController;

  const ProfileFooter({this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: AppBar(
            elevation: 0,
            shape: Border(
              bottom: BorderSide(color: Colors.grey, width: 0.4),
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              controller: tabController,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.table_chart_outlined,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/images/instagram-reels.png',
                    width: 22,
                    height: 22,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              StaggeredGridView.countBuilder(
                padding: const EdgeInsets.only(top: 2),
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemBuilder: (ctx, index) {
                  return Container(
                    child: Image.network(
                      postsData[index].postUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: postsData.length,
                staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  itemBuilder: (ctx, index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          child: Image.network(
                            postsData[index].postUrl,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        Positioned(
                          child: Text(
                            '100 Views',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          left: 14,
                          bottom: 8,
                        ),
                        Positioned(
                          child: Text(
                            'This is your reels',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          bottom: 30,
                          left: 14,
                          right: 14,
                        ),
                      ],
                    );
                  },
                  itemCount: postsData.length,
                  staggeredTileBuilder: (index) => StaggeredTile.extent(1, 280),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget editProfileButton() {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    sliver: SliverToBoxAdapter(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: Colors.white,
          elevation: 0,
          alignment: Alignment.center,
          side: BorderSide(color: Colors.grey[300]),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text('Edit Profile'),
      ),
    ),
  );
}

Widget profileHeader() {
  return SliverPadding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
    sliver: SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              ProfileContainer(
                user: dummyUser,
                radius: 40,
                hasUserStory: false,
              ),
              SizedBox(height: 4),
              Text(
                dummyUser.fullName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '6',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Posts',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '236',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Followers',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '589',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Following',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget profileAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    shape: Border(
      bottom: BorderSide(
        width: 0.1,
        color: Colors.grey,
      ),
    ),
    leading: IconButton(
      visualDensity: VisualDensity.compact,
      icon: Icon(
        MdiIcons.lockOutline,
        color: Colors.black,
      ),
      onPressed: () {},
    ),
    title: GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Text(
            currentUser.userName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Icon(
            Icons.expand_more_outlined,
            color: Colors.black,
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.add_box_outlined,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Image.asset(
          'assets/images/hamburger.png',
          width: 20,
          // color: Colors.grey[800],
        ),
        onPressed: () {},
      ),
    ],
  );
}
