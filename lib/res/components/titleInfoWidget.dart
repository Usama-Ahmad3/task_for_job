import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flu/screens/favorite/favoriteController.dart';

class TitleInfoWidget extends StatefulWidget {
  VoidCallback onTap;
  VoidCallback? onFavorite;
  String over;
  String title;
  String releaseDate;
  String image;
  String language;
  TitleInfoWidget(
      {super.key,
      this.onFavorite,
      required this.image,
      required this.over,
      required this.title,
      required this.releaseDate,
      required this.onTap,
      required this.language});

  @override
  State<TitleInfoWidget> createState() => TitleInfoWidgetState();
}

class TitleInfoWidgetState extends State<TitleInfoWidget> {
  @override
  Widget build(BuildContext context) {
    var favoriteController = Get.put(FavouriteController());
    favoriteController.getFavourites();
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(blurRadius: 3, offset: Offset(2, 2), color: Colors.grey)
            ],
            borderRadius: BorderRadius.circular(height * 0.01),
            color: Colors.white,
          ),
          width: width / 1.6,
          height: height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: width * 0.1),
                  child: Text(widget.title,
                      style: Theme.of(context).textTheme.titleMedium)),
              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: height * 0.002),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.005),
                      border: Border.all(color: Colors.green)),
                  child: Text(
                    'Release Date: ${widget.releaseDate}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.1, right: width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.red, radius: height * 0.003),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      widget.language,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.green),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.red, radius: height * 0.003),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    InkWell(
                      onTap: widget.onFavorite,
                      child: Obx(() => favoriteController.loading == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Icon(
                              favoriteController.favouriteTitle
                                      .contains(widget.title)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: height * 0.02,
                            )),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.1, right: width * 0.01),
                child: InkWell(
                  onTap: widget.onTap,
                  child: Text(
                    'Overview',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.red),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
