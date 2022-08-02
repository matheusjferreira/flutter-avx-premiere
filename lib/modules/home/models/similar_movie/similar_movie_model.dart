import 'results_models.dart';

class SimilarMovieModel {
  int? page;
  List<ResultsModel>? results;
  int? totalPages;
  int? totalResults;

  SimilarMovieModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  SimilarMovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <ResultsModel>[];
      json['results'].forEach((v) {
        results!.add(ResultsModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
