import 'dart:io';

import 'package:chithram_netflix_tmdb/main.dart';
import 'package:chithram_netflix_tmdb/screens/splash_screen.dart';
import 'package:chithram_netflix_tmdb/widget/stack_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image(image: Image.file(File("assets/images/netflix_logo.png")).image),
            firstStack(height: height, width: width),
            FutureBuilder(
                future: contentController.getContent(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CategoryText("Popular Movies On Netflix"),
                          PopularMovies(height: height, width: width),
                          CategoryText("Popular TV On Netflix"),
                          PopularTv(height: height, width: width),
                          CategoryText("Upcoming Movies"),
                          UpComingMovies(height: height, width: width),
                          CategoryText("Trending Now"),
                         StackCard()
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class TrendingNow extends StatelessWidget {
  const TrendingNow({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      child: FutureBuilder<List<dynamic>>(
          future: contentController.getTrending(),
          builder: (context, item) {
            if (item.hasData) {
              List<dynamic> TrendingNow = item.data!;
              return ListView.builder(
                  itemCount: TrendingNow.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // print(TrendingNow[index]);
                    return Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      width: width * 0.4,
                      height: height * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  TrendingNow[index]['poster_path']),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class UpComingMovies extends StatelessWidget {
  const UpComingMovies({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      child: FutureBuilder<List<dynamic>>(
          future: contentController.getUpComming(),
          builder: (context, item) {
            if (item.hasData) {
              List<dynamic> upComingMovies = item.data!;
              return ListView.builder(
                  itemCount: upComingMovies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // print(upComingMovies[index]);
                    return Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      width: width * 0.4,
                      height: height * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  upComingMovies[index]['poster_path']),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class PopularTv extends StatelessWidget {
  const PopularTv({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      child: FutureBuilder<List<dynamic>>(
          future: contentController.getTvShows(),
          builder: (context, item) {
            if (item.hasData) {
              List<dynamic> populartv = item.data!;
              return ListView.builder(
                  itemCount: populartv.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // print(populartv[index]);
                    return Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      width: width * 0.4,
                      height: height * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  populartv[index]['poster_path']),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      child: FutureBuilder<List<dynamic>>(
          future: contentController.getPopularMovies(),
          builder: (context, item) {
            if (item.hasData) {
              List<dynamic> popularMovies = item.data!;
              return ListView.builder(
                  itemCount: popularMovies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // print(popularMovies[index]);
                    return Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      width: width * 0.4,
                      height: height * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  popularMovies[index]['poster_path']),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Widget CategoryText(String text) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

class firstStack extends StatelessWidget {
  const firstStack({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.7,
          decoration: const BoxDecoration(),
          child: Image.network(
            contentController.homePoster,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 30,
          left: 5,
          child: Container(
            width: width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 60,
                  child: Image(image: AssetImage("lib/assets/img/netflix.png")),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      child: Image(
                        image: AssetImage("lib/assets/img/user.jpg"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        // the category listing on the top
        Positioned(
          top: height * 0.12,
          left: 70,
          child: Container(
            width: width * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text1("TV Shows"),
                Text1("Movies"),
                Row(
                  children: [
                    Text1("Categories"),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 120,
            left: 90,
            child: Row(
              children: [
                Text2("psychological  ."),
                Text2("Thriller  ."),
                Text2("Suspenful  ."),
                Text2("Heist  ."),
                Text2("Action  ."),
              ],
            )),
        Positioned(
            bottom: 18,
            left: 50,
            child: Container(
              width: width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text("My List",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ]),
                  ),
                  Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Text("  Play",
                            style:
                                TextStyle(color: Colors.black, fontSize: 19)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text("info",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ]),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

Widget Text2(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Widget Text1(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  );
}
