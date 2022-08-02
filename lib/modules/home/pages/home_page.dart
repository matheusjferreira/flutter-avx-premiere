import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/core/app_api.dart';
import '../../../shared/core/app_colors.dart';
import '../../../shared/helpers/convert_category_helper.dart';
import '../models/movie_details/movie_details_model.dart';
import '../bloc/home_bloc.dart';
import '../models/similar_movie/similar_movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<HomeBloc>();
  MovieDetailsModel? movieDetailsModel;
  SimilarMovieModel? similarMovieModel;
  bool favorite = false;

  @override
  void initState() {
    super.initState();
    bloc.add(GetMoviesDetails());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeLoaded) {
            return _buildBody(state.movieDetailsModel, state.similarMovieModel);
          }

          if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }

  _buildBody(stateMovieDetails, stateSimilarMovie) {
    movieDetailsModel = stateMovieDetails;
    similarMovieModel = stateSimilarMovie;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black.getColor,
        body: Column(
          children: [
            Image.network(
                '${AppApi.mdbImage.getUrl}${movieDetailsModel!.backdropPath}'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        movieDetailsModel!.title!,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white.getColor),
                      ),
                      IconButton(
                        onPressed: () {
                          favorite = !favorite;
                          setState(() {});
                        },
                        icon: !favorite
                            ? Icon(
                                Icons.favorite_border,
                                color: AppColors.white.getColor,
                              )
                            : Icon(
                                Icons.favorite,
                                color: AppColors.white.getColor,
                              ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AppColors.white.getColor,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            movieDetailsModel!.voteCount!.toString(),
                            style: TextStyle(color: AppColors.white.getColor),
                          ),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Row(
                        children: [
                          Icon(
                            Icons.catching_pokemon,
                            color: AppColors.white.getColor,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            movieDetailsModel!.popularity!.toString(),
                            style: TextStyle(color: AppColors.white.getColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: similarMovieModel!.results!.length,
                itemBuilder: (context, index) {
                  String category = '';
                  for (var element
                      in similarMovieModel!.results![index].genreIds!) {
                    category += (convertCategoryHelper(element) + ', ');
                  }
                  return ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 75,
                          child: Image.network(
                            '${AppApi.mdbImage.getUrl}${similarMovieModel!.results![index].backdropPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              similarMovieModel!.results![index].title
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white.getColor),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  similarMovieModel!.results![index].releaseDate
                                      .toString()
                                      .substring(0, 4),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white.getColor),
                                ),
                                const SizedBox(width: 16),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    category.substring(0, category.length - 2),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white.getColor),
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.check_circle,
                                color: AppColors.white.getColor,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
