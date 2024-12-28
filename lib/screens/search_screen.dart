import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_recomentation_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';
import 'package:netflix_clone/services/api_sevices.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool showClearIcon = false;
  ApiSevices apiSevices = ApiSevices();
  late Future<MovieRecommendationModel> popularMovies;
  SearchModel? searchModel;

  void search(String query) {
    apiSevices.getSearchMovie(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    popularMovies = apiSevices.getPopularMovies();
    searchController.addListener(() {
      setState(() {
        showClearIcon = searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.white),
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {
                      if (value.isEmpty) {
                      } else {
                        search(searchController.text);
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 139, 138, 138),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.white54),
                      suffixIcon: showClearIcon
                          ? IconButton(
                              icon:
                                  const Icon(Icons.cancel, color: Colors.grey),
                              onPressed: () {
                                searchController.clear();
                                setState(() {
                                  showClearIcon = false;
                                });
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
              ),
              searchController.text.isEmpty
                  ? FutureBuilder(
                      future: popularMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          }
                          if (!snapshot.hasData ||
                              snapshot.data!.results.isEmpty) {
                            return const Center(child: Text('No data available'));
                          }

                          var data = snapshot.data!.results;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                "Top Searches",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.all(10),
                                itemCount: data.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailedScreen(
                                            movieId: data[index].id,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 150,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.network(
                                              "$imageUrl${data[index].posterPath}"),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                              width: 230,
                                              child: Text(
                                                data[index].title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      })
                  : searchModel == null
                      ? const SizedBox.shrink()
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: searchModel?.results.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 1.2 / 2),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailedScreen(
                                        movieId:
                                            searchModel!.results[index].id),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  searchModel!.results[index].backdropPath ==
                                          null
                                      ? Image.asset(
                                          "assets/netflix_symbol.png",
                                          height: 170,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              "$imageUrl${searchModel!.results[index].backdropPath}",
                                          height: 170,
                                        ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      searchModel!.results[index].originalTitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
            ],
          ),
        ),
      ),
    );
  }
}
