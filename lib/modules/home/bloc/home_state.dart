part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final MovieDetailsModel movieDetailsModel;
  final SimilarMovieModel similarMovieModel;
  
  HomeLoaded({
    required this.movieDetailsModel,
    required this.similarMovieModel,
  });
}

class HomeError extends HomeState {
  HomeError({required this.message});

  final String message;
}
