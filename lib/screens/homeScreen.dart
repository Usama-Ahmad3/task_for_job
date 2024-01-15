import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flu/res/app_colors/app_colors.dart';
import 'package:flu/screens/pageController.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageValueController _pageValueController =
      Get.put(PageValueController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() =>
            _pageValueController.page[_pageValueController.value.toInt()]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Obx(
                () => SalomonBottomBar(
                  curve: Curves.bounceIn,
                  items: [
                    SalomonBottomBarItem(
                        icon: Icon(
                          Icons.movie_creation_outlined,
                          color: AppColors.black,
                        ),
                        title: Text(
                          'Popular',
                          style: TextStyle(color: AppColors.white),
                        ),
                        activeIcon: Icon(
                          Icons.movie,
                          color: AppColors.white,
                        ),
                        selectedColor: AppColors.blue,
                        unselectedColor: AppColors.grey),
                    SalomonBottomBarItem(
                        icon: Icon(
                          Icons.star_border_outlined,
                          color: AppColors.black,
                        ),
                        title: Text(
                          'TopRated',
                          style: TextStyle(color: AppColors.white),
                        ),
                        activeIcon: Icon(
                          Icons.star,
                          color: AppColors.white,
                        ),
                        selectedColor: AppColors.blue,
                        unselectedColor: AppColors.grey),
                    SalomonBottomBarItem(
                        icon: Icon(
                          Icons.upcoming_outlined,
                          color: AppColors.black,
                        ),
                        title: Text(
                          'UpComing',
                          style: TextStyle(color: AppColors.white),
                        ),
                        activeIcon: Icon(
                          Icons.upcoming,
                          color: AppColors.white,
                        ),
                        selectedColor: AppColors.blue,
                        unselectedColor: AppColors.grey),
                    SalomonBottomBarItem(
                        icon: Icon(
                          Icons.favorite_border,
                          color: AppColors.black,
                        ),
                        title: Text(
                          'Favorite',
                          style: TextStyle(color: AppColors.white),
                        ),
                        activeIcon: Icon(
                          Icons.favorite,
                          color: AppColors.white,
                        ),
                        selectedColor: AppColors.blue,
                        unselectedColor: AppColors.grey),
                  ],
                  selectedColorOpacity: 1,
                  duration: const Duration(seconds: 1),
                  backgroundColor: AppColors.grey300,
                  currentIndex: _pageValueController.value.toInt(),
                  onTap: (val) async {
                    _pageValueController.pageChange(val);
                  },
                ),
              )),
        ));
  }
}
