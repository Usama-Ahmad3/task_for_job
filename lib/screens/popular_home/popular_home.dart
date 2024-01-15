import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flu/main.dart';
import 'package:flu/res/components/app_bar_widget.dart';
import 'package:flu/res/app_urls.dart';
import 'package:flu/res/components/MovieListWidget.dart';
import 'package:flu/res/components/internet_loss.dart';
import 'package:flu/screens/pageController.dart';

class PopularHome extends StatefulWidget {
  const PopularHome({super.key});

  @override
  State<PopularHome> createState() => _PopularHomeState();
}

class _PopularHomeState extends State<PopularHome> {
  final PageValueController _pageValueController =
      Get.put(PageValueController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: 'Popular'),
      body: _pageValueController.internet == true
          ? MovieListWidget(
              url: AppUrls.popularMovie, moviesRepository: getIt())
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
