import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/core/app_api.dart';
import '../../../shared/core/app_colors.dart';
import '../../../shared/core/app_fonts.dart';
import '../../../shared/helpers/convert_category_helper.dart';
import '../../../shared/widgets/scaffolds/primary_scaffold_widget.dart';
import '../../../shared/widgets/tiles/details_tile_widget.dart';
import '../../../shared/widgets/tiles/similar_tile_widget.dart';
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
            return const PrimaryScaffoldWidget(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is HomeLoaded) {
            return _buildBody(state.movieDetailsModel, state.similarMovieModel);
          }

          if (state is HomeError) {
            return PrimaryScaffoldWidget(
              body: Center(
                child: Text(state.message, style: AppFonts.title.getFont),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  _buildBody(stateMovieDetails, stateSimilarMovie) {
    movieDetailsModel = stateMovieDetails;
    similarMovieModel = stateSimilarMovie;
    return PrimaryScaffoldWidget(
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
                    Text(movieDetailsModel!.title!,
                        style: AppFonts.title.getFont),
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
                        DetailsTileWidget(
                          icon: Icons.favorite,
                          label: movieDetailsModel!.voteCount!.toString(),
                        ),
                        const SizedBox(width: 24),
                        DetailsTileWidget(
                          icon: Icons.catching_pokemon,
                          label: movieDetailsModel!.popularity!.toString(),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildSimilarList(),
        ],
      ),
    );
  }

  _buildSimilarList() {
    return Expanded(
      child: ListView.builder(
        itemCount: similarMovieModel!.results!.length,
        itemBuilder: (context, index) {
          String category = '';
          for (var element in similarMovieModel!.results![index].genreIds!) {
            category += (convertCategoryHelper(element) + ', ');
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SimilarTileWidget(
              srcImage:
                  '${AppApi.mdbImage.getUrl}${similarMovieModel!.results![index].backdropPath}',
              title: similarMovieModel!.results![index].title.toString(),
              firstSubtitle: similarMovieModel!.results![index].releaseDate
                  .toString()
                  .substring(0, 4),
              secondSubtitle: category.substring(0, category.length - 2),
              suffixIcon: Icons.check_circle,
            ),
          );
        },
      ),
    );
  }
}
