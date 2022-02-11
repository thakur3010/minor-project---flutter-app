import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tmdb_api/tmdb_api.dart';

String api = '6938be0bb992ef9fbe27ca62b2f5ebcb';
String token =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OTM4YmUwYmI5OTJlZjlmYmUyN2NhNjJiMmY1ZWJjYiIsInN1YiI6IjYxNThhYTZlMWM2MzViMDA0NDdkYzM1OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GvbGEHnVIVGbFHfL6g5ZzU0i-nH0D0bGfQfq-_TMV6o';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> trendingMovies = [];
  List<dynamic> trendingShows = [];

  getData() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(api, token),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map result = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map shows = await tmdbWithCustomLogs.v3.tv.getPouplar();
    setState(() {
      trendingMovies = result['results'];
      trendingShows = shows['results'];
    });
    print(trendingShows);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Top Trending Movies"),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 250.0,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      width: 140,
                      child: InkWell(
                        child: Image(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original/' +
                                  trendingMovies[index]['poster_path']),
                        ),
                      ),
                    ),
                    trendingMovies[index]['title'] != null
                        ? Text(
                            trendingMovies[index]['title'],
                          )
                        : Text(
                            "Loading..",
                          ),
                  ],
                );
              },
            )),
        Text('Top TV Shows'),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 240.0,
            child: ListView.builder(

              scrollDirection: Axis.horizontal,
              itemCount: trendingMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      width: 130,
                      child: InkWell(
                        child: Image(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original/' +
                                  trendingShows[index]['poster_path']),
                        ),
                      ),
                    ),
                    trendingShows[index]['original_name'] != null
                        ? Text(
                            trendingShows[index]['original_name'],
                          )
                        : Text(
                            "Loading..",
                          ),
                  ],
                );
              },
            ))
      ],
    );
  }
}
