import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flu/main.dart';
import 'package:flu/res/components/app_bar_widget.dart';
import 'package:flu/res/app_urls.dart';
import 'package:flu/res/components/MovieListWidget.dart';
import 'package:flu/res/components/internet_loss.dart';
import 'package:flu/screens/pageController.dart';

class UpComing extends StatefulWidget {
  const UpComing({super.key});

  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  final PageValueController _pageValueController =
      Get.put(PageValueController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: 'Up Coming'),
      body: _pageValueController.internet == true
          ? MovieListWidget(
              url: AppUrls.upComingMovie, moviesRepository: getIt())
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
