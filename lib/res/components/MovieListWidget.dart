import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flu/domain/movies_repository.dart';
import 'package:flu/screens/favorite/favoriteController.dart';
import 'package:flu/utils/dialogBox.dart';
import 'picWidget.dart';
import 'titleInfoWidget.dart';

class MovieListWidget extends StatefulWidget {
  String url;
  MoviesRepository moviesRepository;
  MovieListWidget(
      {super.key, required this.url, required this.moviesRepository});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    var favoriteController = Get.put(FavouriteController());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          FutureBuilder(
            future: widget.moviesRepository.getMovies(widget.url, context),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return SizedBox(
                  height: height * 0.9,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          itemCount: snapshot.data!.results!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final image = snapshot
                                .data!.results![index].posterPath
                                .toString();
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.01),
                              width: width,
                              height: height / 4,
                              child: Stack(
                                children: [
                                  ///titleInfo Widget
                                  TitleInfoWidget(
                                      image: image,
                                      over: snapshot
                                          .data!.results![index].overview
                                          .toString(),
                                      title: snapshot
                                          .data!.results![index].title
                                          .toString(),
                                      releaseDate: snapshot
                                          .data!.results![index].releaseDate
                                          .toString(),
                                      onTap: () {
                                        ///Overview Field From API
                                        DialogBox().alertDialog(
                                            snapshot
                                                .data!.results![index].overview
                                                .toString(),
                                            context);
                                      },

                                      ///check if item in favorite then remove otherwise add
                                      onFavorite: () async {
                                        ///removing item on click that's already in the Favorite List
                                        favoriteController.addOrRemoveFavorites(
                                            snapshot.data, index);
                                      },
                                      language: snapshot.data!.results![index]
                                          .originalLanguage
                                          .toString()),

                                  ///pic widget
                                  PicWidget(
                                    size: MediaQuery.sizeOf(context),
                                    image: image,
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
