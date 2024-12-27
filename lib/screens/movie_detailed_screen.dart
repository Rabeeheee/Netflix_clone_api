import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detailed_model.dart';
import 'package:netflix_clone/models/movie_recomentation_model.dart';
import 'package:netflix_clone/services/api_sevices.dart';

class MovieDetailedScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailedScreen({super.key, required this.movieId});

  @override
  State<MovieDetailedScreen> createState() => _MovieDetailedScreenState();
}

class _MovieDetailedScreenState extends State<MovieDetailedScreen> {
  ApiSevices apiSevices = ApiSevices();

  late Future<MovieDetailedModel> movieDetail;
  late Future<MovieRecommendationModel> movieRecomentations;

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  fetchInitialData() {
    movieDetail = apiSevices.getMovieDetail(widget.movieId);
    movieRecomentations = apiSevices.getMovieRecomentations(widget.movieId);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log("${widget.movieId}");
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: movieDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movie = snapshot.data;
                String genereText =
                    movie!.genres.map((genre) => genre.name).join(",");
                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "$imageUrl${movie.backdropPath}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              movie.releaseDate.year.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              width: 300,
                              child: Text(
                                genereText,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          movie.overview,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FutureBuilder(
                        future: movieRecomentations,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final movie = snapshot.data;

                            return movie!.results.isEmpty
                                ? SizedBox()
                                : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("More Like This"),
                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                      GridView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: movie.results.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisSpacing: 15,
                                                crossAxisSpacing: 5,
                                                childAspectRatio: 1.2 / 2),
                                        itemBuilder: (context, index) {
                                        return  InkWell(
                                           onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailedScreen(
                                            movieId: movie.results[index].id,
                                          ),
                                        ),
                                      );
                                    },
                                          child: CachedNetworkImage(
                                              imageUrl:
                                                  "${imageUrl}${movie.results[index].posterPath}",
                                            ),
                                        );
                                        },
                                      )
                                    ],
                                  );
                          }return const Text("Somthing went wrong");
                        }
                        
                        )
                  ],
                );
              } else {
                return Text("error");
              }
            }),
      ),
    );
  }
}
