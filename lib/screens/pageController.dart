import 'package:get/get.dart';
import 'package:flu/utils/internet_check.dart';

import 'favorite/favorite.dart';
import 'popular_home/popular_home.dart';
import 'top_rated/topRated.dart';
import 'up_coming/upcoming.dart';

///it is used To control the Tab Bar with getx
class PageValueController extends GetxController {
  InternetCheck internetCheck = InternetCheck();

  ///Screens in the tab bar
  final page = [
    const PopularHome(),
    const TopRated(),
    const UpComing(),
    const Favorite(),
  ];
  RxInt value = 0.obs;
  RxBool internet = true.obs;
  pageChange(int val) async {
    internet = RxBool(await internetCheck.connectivityCheck());
    value.value = val;
  }
}
