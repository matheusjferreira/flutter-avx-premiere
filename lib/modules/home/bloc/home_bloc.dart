import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../shared/core/app_errors.dart';
import '../models/movie_details/movie_details_model.dart';
import '../models/similar_movie/similar_movie_model.dart';
import '../repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc(this._homeRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        await Future.delayed(const Duration(seconds: 3));
        var resultMovieDetails = await _homeRepository.getDetails();
        var resultSimilarMovie = await _homeRepository.getSimilar();
        emit(HomeLoaded(movieDetailsModel: resultMovieDetails, similarMovieModel: resultSimilarMovie));
      } on AppErrors catch (e) {
        emit(HomeError(message: e.getMessage));
      }
    });
  }
}
