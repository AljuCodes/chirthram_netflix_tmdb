import 'package:chithram_netflix_tmdb/screens/coming_soon.dart';
import 'package:chithram_netflix_tmdb/screens/downloads_screen.dart';
import 'package:chithram_netflix_tmdb/screens/gameScreen.dart';
import 'package:chithram_netflix_tmdb/screens/home_screen.dart';
import 'package:chithram_netflix_tmdb/screens/laughing_screen.dart';
import 'package:flutter/material.dart';

class TabContainerBottom extends StatefulWidget {
  TabContainerBottom({this.index1});
  int? index1;

  @override
  _TabContainerBottomState createState() => _TabContainerBottomState();
}

class _TabContainerBottomState extends State<TabContainerBottom> {
  int tabIndex = 0;

  late final List<Widget>? listScreens;
  @override
  void initState() {
    print("tabindex is $tabIndex");
    int? tabIndex1 = widget.index1;
    print("tabindex1 from widget is  is $tabIndex1");
    tabIndex = widget.index1??0;
    print("tabindex after checking $tabIndex");
    super.initState();
    listScreens = [HomeScreen(), GameScreen(), CommingSoon(),FastLaugh(),DownloadScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreens![tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.red,
        backgroundColor: const Color.fromARGB(0, 36, 36, 182),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
         
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
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
              icon: const Icon(Icons.movie),
              label: "New & Hot",
            ),
                const BottomNavigationBarItem(
              icon: const Icon(Icons.play_circle_fill_rounded),
              label: "Fast Laugh",
            ),
                const BottomNavigationBarItem(
              icon: const Icon(Icons.download_for_offline_rounded),
              label: "Downloads",
            ),
          ]),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
