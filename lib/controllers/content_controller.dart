import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieAuth {
  static const apiKey = "7700788415dabe96e0c127b2e1a4348d";
  static const readAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NzAwNzg4NDE1ZGFiZTk2ZTBjMTI3YjJlMWE0MzQ4ZCIsInN1YiI6IjYyMTg1NjZkYTI3NTAyMDA2ZDc0ZDlmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8nEg3aKUXzxg1QcUN6YR4ChyHSVidKQXfdNOiS8Uips";
}

class ContentController extends GetxController {
  String homePoster =
      "http://m.gettywallpapers.com/wp-content/uploads/2020/08/Money-Heist-Wallpaper-576x1024.jpg";
  List trending = [];
  List popularMovies = [];
  List tvShows = [];
  TMDB? tmdbData;
  Future<TMDB> getContent() async {
    print("111 getContent");
    tmdbData = TMDB(
      ApiKeys(MovieAuth.apiKey, MovieAuth.readAccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    // Map trending = await tmdbData!.v3.trending.getTrending();
    // Map popularMoviesResult = await tmdbData!.v3.movies.getPopular();
    // Map tvShowsResult = await tmdbData!.v3.tv.getPopular();
    // Map upComming = await tmdbData!.v3.movies.getUpcoming();
    // popularMovies = popularMoviesResult["results"];
    // tvShows = tvShowsResult["results"];
    // print("111  trending is ${trending}");
    // print("");

    // print("111 popular movies is  ${popularMovies}");
    // print("");
    // print("111 tv shows is  ${tvShows}");
    return tmdbData!;
  }

  Future<List<dynamic>> getTrending() async {
    Map trendingResult = await tmdbData!.v3.trending.getTrending();
    trending = trendingResult["results"];
    return trending;
  }

  Future<List<dynamic>> getPopularMovies() async {
    Map popularMoviesResult = await tmdbData!.v3.movies.getPopular();
    popularMovies = popularMoviesResult["results"];
    print("popular moveis is working and the popular movies is ${popularMovies}");
    return popularMovies;
  }

  Future<List<dynamic>> getTvShows() async {
    Map tvShowsResult = await tmdbData!.v3.tv.getPopular();
    tvShows = tvShowsResult["results"];
    return tvShows;
  }

  Future<List<dynamic>> getUpComming() async {
    Map upCommingResult = await tmdbData!.v3.movies.getUpcoming();
   List upComming = upCommingResult["results"];
    return upComming;
  }
}
