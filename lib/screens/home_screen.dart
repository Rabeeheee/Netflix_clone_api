import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/models/upcoming_model.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/services/api_sevices.dart';
import 'package:netflix_clone/widgets/custom_carousal.dart';
import 'package:netflix_clone/widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcommingMovieModel> upcomingFuture;
  late Future<UpcommingMovieModel> nowPlayingFuture;
  late Future<TvSeriesModel> topRatedSeries;

  ApiSevices apiSevices = ApiSevices();

  @override
  void initState() {
    upcomingFuture = apiSevices.getUpcomingMovie();
    nowPlayingFuture = apiSevices.getNowPlayingMovies();
    topRatedSeries = apiSevices.getTopRatedSeries();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Image.asset(
          "assets/netflix_logo.png",
          height: 50,
          width: 120,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              child: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.blue,
              height: 25,
              width: 25,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: topRatedSeries,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CustomCarousalSlider(data: snapshot.data!);
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                  future: nowPlayingFuture, headLineText: "Now Playing Movies"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                  future: upcomingFuture, headLineText: "Upcoming Movies"),
            ),
          ],
        ),
      ),
    );
  }
}
