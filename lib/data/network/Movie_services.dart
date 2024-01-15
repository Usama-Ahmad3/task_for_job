import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flu/data/app_exceptions.dart';
import 'package:flu/data/model/movie.dart';
import 'package:flu/domain/domain_movies.dart';
import 'package:flu/domain/movies_repository.dart';
import 'package:flu/utils/flushbar.dart';

class MovieServices implements MoviesRepository {
  @override
  Future<DomainMovies> getMovies(String url, BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(url));
      var data;
      if (response.statusCode == 200) {
        print('object');
        data = jsonDecode(response.body.toString());
        return Movie.fromJson(data).toDomain();
      }
    } on SocketException {
      throw InternetException();
    } on RequestTimeout {
      throw RequestTimeout('');
    } catch (e) {
      // ignore: use_build_context_synchronously
      await Utils.flushBar(e.toString(), context, 'Error');
      print(e.toString());
    }
    throw FetchDataException('');
  }
}
