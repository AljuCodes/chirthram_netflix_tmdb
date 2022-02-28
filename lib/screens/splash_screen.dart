import 'dart:async';

import 'package:chithram_netflix_tmdb/screens/home_screen.dart';
import 'package:chithram_netflix_tmdb/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      
Navigator.of(context).pop();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _buildLogoAnime(),
        
      ),
    );
  }

  Widget _buildLogoAnime() {
    return Container(
      child: Lottie.asset(
        'lib/assets/animation/netflix.json',
        fit: BoxFit.fill,
        width: 250,
        height: 250,
      ),
    );
  }
}
