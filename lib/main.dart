import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_redesign/model/current_user.dart';
import 'package:instagram_redesign/provider/post_provider.dart';
import 'package:instagram_redesign/screens/add_post_screen.dart';
import 'package:instagram_redesign/screens/home_screen.dart';
import 'package:instagram_redesign/screens/login_screen.dart';
import 'package:instagram_redesign/screens/profile_screen.dart';
import 'package:instagram_redesign/screens/sign_up_screen.dart';
import 'package:instagram_redesign/widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CurrentUser(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PostProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.blue,
          primaryColor: Colors.red,
          fontFamily: 'SFDisplay',
        ),
        home: _checkAuth(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          AddPostScreen.routeName: (ctx) => AddPostScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/profile_screen') {
            return MaterialPageRoute(
              builder: (ctx) => ProfileScreen(),
              settings: settings,
            );
          }
          return null;
        },
      ),
    );
  }

  Widget _checkAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, AsyncSnapshot<User> userSnapshot) {
        if (userSnapshot.hasData) {
          Provider.of<CurrentUser>(ctx).currentUserId = userSnapshot.data.uid;
          return BottomNavBar();
        }
        return LoginScreen();
      },
    );
  }
}
