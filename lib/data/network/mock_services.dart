import 'package:flutter/src/widgets/framework.dart';
import 'package:flu/data/model/Movie.dart';
import 'package:flu/domain/domain_movies.dart';
import 'package:flu/domain/movies_repository.dart';

class MockServices implements MoviesRepository {
  @override
  Future<DomainMovies> getMovies(String url, BuildContext context) async =>
      Movie(
        totalResults: 2,
        totalPages: 2,
        results: [
          Results(
            id: 1,
            title: 'Check',
            voteCount: 2,
            releaseDate: '21-02-2022',
            posterPath: '',
            popularity: 2,
            overview: 'dndsh kajhdashh jahsgadygd',
            originalTitle: 'gdsdhgvsdshkj',
            originalLanguage: 'en',
            genreIds: [3],
            backdropPath: 'djd',
            adult: true,
          )
        ],
        page: 2,
      ).toDomain();
}
