import 'package:chithram_netflix_tmdb/controllers/content_controller.dart';
import 'package:chithram_netflix_tmdb/screens/coming_soon.dart';
import 'package:chithram_netflix_tmdb/screens/downloads_screen.dart';
import 'package:chithram_netflix_tmdb/screens/home_screen.dart';
import 'package:chithram_netflix_tmdb/screens/laughing_screen.dart';
import 'package:chithram_netflix_tmdb/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/splash_screen.dart';
final contentController = Get.put(ContentController());
void main() {
HomeScreen();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: TabContainerBottom(),
    );
  }
}

