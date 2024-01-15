import 'package:flutter/material.dart';
import 'package:flu/domain/domain_movies.dart';

abstract class MoviesRepository {
  Future<DomainMovies> getMovies(String url, BuildContext context);
}
