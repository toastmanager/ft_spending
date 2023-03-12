// Standart Packages
import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/material.dart';

// Firebase
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'firebase_options.dart';

// Pages
import 'frontend/pages/home_page.dart' as HomePage;
import 'frontend/pages/activity_page.dart' as ActivityPage;
import 'frontend/pages/404_page.dart' as NotFoundPage;
import 'frontend/pages/searching_page.dart' as SearchingPage;

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseDatabase database = FirebaseDatabase.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      onUnknownRoute: (settings) => NotFoundPage.NotFoundPage(),
      onGenerateRoute: (settings) {
        var path = settings.name!.split('/');

        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              // return MainScaffold(body: HomePage.HomePage());
              return MainScaffold(body: SearchingPage.SearchingPage());
            },
          );
        }

        if (path[1] == 'activity') {
          return MaterialPageRoute(
            builder: (context) {
              return MainScaffold(
                body: ActivityPage.ActivityPage(index: int.parse(path[2]))
              );
            },
          );
        }

        if (path[1] == 'search') {
          return MaterialPageRoute(
            builder: (context) {
              return MainScaffold(body: SearchingPage.SearchingPage());
            },
          );
        }

        return NotFoundPage.NotFoundPage();
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MainScaffold extends StatelessWidget {
  Widget body;

  MainScaffold({
    super.key,
    required Widget this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: AppBar(
        actions: [
          Text('data')
        ],
      )
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}