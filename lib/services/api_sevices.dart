
import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detailed_model.dart';
import 'package:netflix_clone/models/movie_recomentation_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/models/upcoming_model.dart';
import 'package:http/http.dart' as http;

const baseUrl  = "https://api.themoviedb.org/3/";
var key = "api_key=$apiKey";
late String endPoint; 

class ApiSevices{
  Future<UpcommingMovieModel> getUpcomingMovie() async{
 endPoint = "movie/upcoming?";
 final url = "$baseUrl$endPoint$key";


 final respones = await http.get(Uri.parse(url));

 if(respones.statusCode == 200){
  log('Success upcoming movies');
  

  return UpcommingMovieModel.fromJson(jsonDecode(respones.body));
 }
 throw Exception("Failed to load upcoming movies");
  }

   Future<UpcommingMovieModel> getNowPlayingMovies() async{
 endPoint = "movie/now_playing?";
 final url = "$baseUrl$endPoint$key";


 final respones = await http.get(Uri.parse(url));

 if(respones.statusCode == 200){
  log('Success now playing movies');
  

  return UpcommingMovieModel.fromJson(jsonDecode(respones.body));
 }
 throw Exception("Failed to load now playing movies");
  }

   Future<TvSeriesModel> getTopRatedSeries() async{
 endPoint = "tv/top_rated?";
 final url = "$baseUrl$endPoint$key";


 final respones = await http.get(Uri.parse(url));

 if(respones.statusCode == 200){
  log('Success TopRatedSeries');
  

  return TvSeriesModel.fromJson(jsonDecode(respones.body));
 }
 throw Exception("Failed to load Top Rated tv series");
  }

   Future<SearchModel> getSearchMovie(String searchText) async{
 endPoint = "search/movie?query=$searchText&";
 final url = "$baseUrl$endPoint$key";
log("search url is :$url");

 final respones = await http.get(Uri.parse(url));

 if(respones.statusCode == 200){
  log('Success search');
  

  return SearchModel.fromJson(jsonDecode(respones.body));
 }
 throw Exception("Failed to load searched movie");
  }

 Future<MovieRecommendationModel> getPopularMovies() async{
 endPoint = "movie/popular?";
 final url = "$baseUrl$endPoint$key";


 final respones = await http.get(Uri.parse(url));

 if(respones.statusCode == 200){
  log('Success To search');
  

  return MovieRecommendationModel.fromJson(jsonDecode(respones.body));
 }
 throw Exception("Failed to load popular Movies");
  }

  Future<MovieDetailedModel> getMovieDetail(int movieId) async{
 endPoint = "movie/$movieId?";
 final url = "$baseUrl$endPoint$key";


 final respones = await http.get(Uri.parse(url));

 if(respones.statusCode == 200){
  log('Success detail');
  

  return MovieDetailedModel.fromJson(jsonDecode(respones.body));
 }
 throw Exception("Failed to load movie details");
  }

   Future<MovieRecommendationModel> getMovieRecomentations(int movieId) async{
 endPoint = "movie/$movieId/recommendations?";
 final url = "$baseUrl$endPoint$key";


 final respones = await http.get(Uri.parse(url));

 if(respones.statusCode == 200){
  log('Success Recommentations');
  

  return MovieRecommendationModel.fromJson(jsonDecode(respones.body));
 }
 throw Exception("Failed to load more Like this");
  }

   
}