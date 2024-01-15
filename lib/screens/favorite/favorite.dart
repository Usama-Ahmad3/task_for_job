import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flu/res/components/app_bar_widget.dart';
import 'package:flu/res/components/picWidget.dart';
import 'package:flu/res/components/titleInfoWidget.dart';
import 'package:flu/screens/favorite/empty.dart';
import 'package:flu/screens/favorite/favoriteController.dart';
import 'package:flu/utils/dialogBox.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => FavoriteState();
}

class FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var favoriteController = Get.put(FavouriteController());
    favoriteController.getFavourites();
    return Scaffold(
        appBar: appBarWidget(title: 'Favorite'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SingleChildScrollView(
                  child: Column(
                children: [
                  GetBuilder<FavouriteController>(
                    builder: (controller) => favoriteController
                                    .favouriteTitle ==
                                null ||
                            favoriteController.favouriteTitle.isEmpty
                        ? EmptyScreen(
                            text: 'Nothing in the favorite',
                            text2: 'Go back and add some favorites')
                        : ListView.builder(
                            itemCount: favoriteController.favouriteTitle.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 5),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                                child: Stack(
                                  children: [
                                    ///titleInfo Widget
                                    TitleInfoWidget(
                                      onFavorite: () async {
                                        ///removing item on click that's already in the Favorite List
                                        favoriteController
                                            .removeAlreadyInFavorite(index);
                                        controller.update();
                                      },
                                      image:
                                          'https://image.tmdb.org/t/p/w342${favoriteController.favouriteImage[index]}',
                                      over: favoriteController
                                          .favouriteOver[index],
                                      title: favoriteController
                                          .favouriteTitle[index],
                                      releaseDate: favoriteController
                                          .favouriteDate[index],

                                      ///Overview Field From API
                                      onTap: () {
                                        DialogBox().alertDialog(
                                            favoriteController
                                                .favouriteOver[index],
                                            context);
                                      },
                                      language: favoriteController
                                          .favouriteLang[index],
                                    ),

                                    ///pic widget
                                    PicWidget(
                                      size: MediaQuery.sizeOf(context),
                                      image:
                                          'https://image.tmdb.org/t/p/w342${favoriteController.favouriteImage[index]}',
                                    )
                                  ],
                                ),
                              );
                            }),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
