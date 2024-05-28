

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';


class MoviesProvider extends ChangeNotifier {
  final String _apiKey =  'df94e35d6a00ea17f1a05531049a9210';
  final String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZjk0ZTM1ZDZhMDBlYTE3ZjFhMDU1MzEwNDlhOTIxMCIsInN1YiI6IjYxMDFlMjBlN2Q1ZjRiMDA3NDMxMTFjMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9EN0hd44IZ-IwKNAHqgA-nJ6hMFQxvHO8DmPMXNzSH0';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';


  List<Movie> onDisplayMovies = [];
  List<Movie> pupularsMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  MoviesProvider() {
    getOnDisplayMovies();
    getPopulars();
  }

  getOnDisplayMovies() async {
    var response = await _getJsonData('/3/discover/movie', 1);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopulars() async {
    var response =  await _getJsonData('/3/tv/popular', 1);
    final populars = NowPlayingResponse.fromJson(response);
    pupularsMovies = [...pupularsMovies, ...populars.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast( int movieId ) async {
    if( moviesCast.containsKey(movieId) ) return moviesCast[movieId]!;
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson( jsonData );
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }




  Future<String> _getJsonData( String endpoint, [int page = 1] ) async {
    final url = Uri.https( _baseUrl, endpoint, {
      'Authorization': 'Bearer $_accessToken',
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    });
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

    Future<List<Movie>> searchMovies( String query) async {

    final url = Uri.https( _baseUrl, '3/search/movie', {
      'Authorization': 'Bearer $_accessToken',
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body); 
    return searchResponse.results;
  }

  getPopularMovies() {}

  


}
