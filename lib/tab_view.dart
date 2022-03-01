import 'package:chithram_netflix_tmdb/screens/coming_soon.dart';
import 'package:chithram_netflix_tmdb/screens/downloads_screen.dart';
import 'package:chithram_netflix_tmdb/screens/gameScreen.dart';
import 'package:chithram_netflix_tmdb/screens/home_screen.dart';
import 'package:chithram_netflix_tmdb/screens/laughing_screen.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> currentIndex = ValueNotifier(0);

class TabContainerBottom extends StatelessWidget {
  final listScreens = [
    HomeScreen(),
    GameScreen(),
    CommingSoon(),
    FastLaugh(),
    DownloadScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context,int  newIndex, _) {
          return Scaffold(
            body: listScreens[newIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: newIndex,
                type: BottomNavigationBarType.fixed,
                // fixedColor: Colors.red,
                backgroundColor: Colors.black,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                onTap: (int index) {
                  currentIndex.value = index;
                },
                items: [
                  const BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: 'Home',
                  ),
                  const BottomNavigationBarItem(
                    icon: const Icon(Icons.gamepad_outlined),
                    label: "Game",
                  ),
                  const BottomNavigationBarItem(
                    icon: const Icon(Icons.collections),
                    label: "New & Hot",
                  ),
                  const BottomNavigationBarItem(
                    icon: const Icon(Icons.emoji_emotions),
                    label: "Fast Laugh",
                  ),
                  const BottomNavigationBarItem(
                    icon: const Icon(Icons.download_for_offline_rounded),
                    label: "Downloads",
                  ),
                ]),
            backgroundColor: Colors.black,
          );
        });
  }
}
