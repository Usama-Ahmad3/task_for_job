class DomainMovies {
  int? page;
  List<DomainResults>? results;
  int? totalPages;
  int? totalResults;
  DomainMovies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
}

class DomainResults {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  int? voteCount;
  DomainResults({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteCount,
  });
}
