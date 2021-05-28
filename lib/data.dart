import 'package:instagram_redesign/model/post.dart';

import 'model/user.dart';

final currentUser = User(
  userName: 'htz_14',
  profileUrl:
      'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
);

final dummyUser = User(
  userName: 'htz_14',
  profileUrl:
      'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
);

final List<User> stories = [
  User(
    userName: 'david_brooks',
    profileUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    userName: 'jane_doe',
    profileUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    userName: 'matthew_hinkle',
    profileUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  User(
    userName: 'amy_smith',
    profileUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  User(
    userName: 'ed_morris',
    profileUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  User(
    userName: 'carolyn_duncan',
    profileUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    userName: 'paul_pinnock',
    profileUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  User(
      userName: 'elizabeth_wong',
      profileUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  User(
    userName: 'james_lathrop',
    profileUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  User(
    userName: 'jessie_samson',
    profileUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    userName: 'david_brooks',
    profileUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    userName: 'jane_doe',
    profileUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    userName: 'matthew_hinkle',
    profileUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  User(
    userName: 'amy_smith',
    profileUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  User(
    userName: 'ed_morris',
    profileUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  User(
    userName: 'carolyn_duncan',
    profileUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    userName: 'paul_pinnock',
    profileUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  User(
      userName: 'elizabeth_wong',
      profileUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  User(
    userName: 'james_lathrop',
    profileUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  User(
    userName: 'jessie_samson',
    profileUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  )
];

final List<Post> postsData = [
  Post(
    authorId: 'david_brooks',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption, you can follow me.',
    postUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'jane_doe',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'matthew_hinkle',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  Post(
    authorId: 'amy_smith',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  Post(
    authorId: 'ed_morris',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  Post(
    authorId: 'carolyn_duncan',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'paul_pinnock',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  Post(
    authorId: 'elizabeth_wong',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80',
  ),
  Post(
    authorId: 'james_lathrop',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  Post(
    authorId: 'jessie_samson',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'david_brooks',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'jane_doe',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'matthew_hinkle',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  Post(
    authorId: 'amy_smith',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  Post(
    authorId: 'ed_morris',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  Post(
    authorId: 'carolyn_duncan',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'paul_pinnock',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  Post(
      authorId: 'elizabeth_wong',
      likes: 100,
      location: 'Rajkot, Gujarat',
      caption: 'This is my short caption',
      postUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  Post(
    authorId: 'james_lathrop',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  Post(
    authorId: 'jessie_samson',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'david_brooks',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'jane_doe',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'matthew_hinkle',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  Post(
    authorId: 'amy_smith',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  Post(
    authorId: 'ed_morris',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  Post(
    authorId: 'carolyn_duncan',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'paul_pinnock',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  Post(
    authorId: 'elizabeth_wong',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80',
  ),
  Post(
    authorId: 'james_lathrop',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  Post(
    authorId: 'jessie_samson',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'david_brooks',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'jane_doe',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'matthew_hinkle',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  Post(
    authorId: 'amy_smith',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  Post(
    authorId: 'ed_morris',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  Post(
    authorId: 'carolyn_duncan',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'paul_pinnock',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  Post(
      authorId: 'elizabeth_wong',
      likes: 100,
      location: 'Rajkot, Gujarat',
      caption: 'This is my short caption',
      postUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  Post(
    authorId: 'james_lathrop',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  Post(
    authorId: 'jessie_samson',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'david_brooks',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'jane_doe',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'matthew_hinkle',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  Post(
    authorId: 'amy_smith',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  Post(
    authorId: 'ed_morris',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  Post(
    authorId: 'carolyn_duncan',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'paul_pinnock',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  Post(
    authorId: 'elizabeth_wong',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80',
  ),
  Post(
    authorId: 'james_lathrop',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  Post(
    authorId: 'jessie_samson',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'david_brooks',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'jane_doe',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'matthew_hinkle',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  Post(
    authorId: 'amy_smith',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  Post(
    authorId: 'ed_morris',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  Post(
    authorId: 'carolyn_duncan',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'paul_pinnock',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  Post(
      authorId: 'elizabeth_wong',
      likes: 100,
      location: 'Rajkot, Gujarat',
      caption: 'This is my short caption',
      postUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  Post(
    authorId: 'james_lathrop',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  Post(
    authorId: 'jessie_samson',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'david_brooks',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'jane_doe',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'matthew_hinkle',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  Post(
    authorId: 'amy_smith',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  Post(
    authorId: 'ed_morris',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  Post(
    authorId: 'carolyn_duncan',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'paul_pinnock',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  Post(
    authorId: 'elizabeth_wong',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80',
  ),
  Post(
    authorId: 'james_lathrop',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  Post(
    authorId: 'jessie_samson',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'david_brooks',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'jane_doe',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'matthew_hinkle',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  Post(
    authorId: 'amy_smith',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  Post(
    authorId: 'ed_morris',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  Post(
    authorId: 'carolyn_duncan',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Post(
    authorId: 'paul_pinnock',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  Post(
      authorId: 'elizabeth_wong',
      likes: 100,
      location: 'Rajkot, Gujarat',
      caption: 'This is my short caption',
      postUrl:
          'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  Post(
    authorId: 'james_lathrop',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  Post(
    authorId: 'jessie_samson',
    likes: 100,
    location: 'Rajkot, Gujarat',
    caption: 'This is my short caption',
    postUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
];
