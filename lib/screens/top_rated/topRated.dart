import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flu/main.dart';
import 'package:flu/res/components/app_bar_widget.dart';
import 'package:flu/res/app_urls.dart';
import 'package:flu/res/components/MovieListWidget.dart';
import 'package:flu/res/components/internet_loss.dart';
import 'package:flu/screens/pageController.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  final PageValueController _pageValueController =
      Get.put(PageValueController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: 'Top Rated'),
      body: _pageValueController.internet == true
          ? MovieListWidget(
              url: AppUrls.topRatedMovie, moviesRepository: getIt())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: const InternetLoss(),
                  ),
                ],
              ),
            ),
    );
  }
}
