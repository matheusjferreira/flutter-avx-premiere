import 'package:dio/dio.dart';

import '../../../shared/core/app_api.dart';

import '../models/movie_details/movie_details_model.dart';
import '../models/similar_movie/similar_movie_model.dart';

class HomeRepository {
  final Dio _dio;

  HomeRepository(this._dio);

  Future<MovieDetailsModel> getDetails() async {
    var response = await _dio.get(
        'https://api.themoviedb.org/3/movie/${AppApi.movieDatails.getUrl}');
    final result = MovieDetailsModel.fromJson(response.data);
    return result;
  }

  Future<SimilarMovieModel> getSimilar() async {
    var response = await _dio.get(
        'https://api.themoviedb.org/3/movie/${AppApi.similarMovies.getUrl}');
    final result = SimilarMovieModel.fromJson(response.data);
    return result;
  }
}
