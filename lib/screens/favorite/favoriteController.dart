import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends GetxController {
  var favouriteImage = <String>[].obs;
  var favouriteTitle = <String>[].obs;
  var favouriteDate = <String>[].obs;
  var favouriteOver = <String>[].obs;
  var favouriteLang = <String>[].obs;
  RxBool loading = false.obs;

  ///Removing methods form Shared Preference and favorite list
  removeImage(String value) async {
    favouriteImage.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Image', favouriteImage);
  }

  removeTitle(String value) async {
    favouriteTitle.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Title', favouriteTitle);
  }

  removeDate(String value) async {
    favouriteDate.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Date', favouriteDate);
  }

  removeLang(String value) async {
    favouriteLang.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Lang', favouriteLang);
  }

  removeOver(String value) async {
    favouriteOver.remove(value);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Over', favouriteOver);
  }

  ///Adding methods form Shared Preference and favorite list
  addImage(String e) async {
    favouriteImage.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Image', favouriteImage);
  }

  addTitle(String e) async {
    favouriteTitle.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Title', favouriteTitle);
  }

  addDate(String e) async {
    favouriteDate.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Date', favouriteDate);
  }

  addLang(String e) async {
    favouriteLang.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Lang', favouriteLang);
  }

  addOver(String e) async {
    favouriteOver.add(e);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Over', favouriteOver);
  }

  removeAlreadyInFavorite(int index) {
    if (favouriteTitle.contains(favouriteTitle[index])) {
      removeImage(favouriteImage[index]);
      removeTitle(favouriteTitle[index]);
      removeLang(favouriteLang[index]);
      removeDate(favouriteDate[index]);
      removeOver(favouriteOver[index]);
    }
  }

  addOrRemoveFavorites(data, index) {
    loading.value = true;

    ///removing item on click that's already in the Favorite List
    if (favouriteTitle.contains(data.results![index].title.toString())) {
      removeImage(data.results![index].posterPath.toString());
      removeTitle(data.results![index].title.toString());
      removeLang(data.results![index].originalLanguage.toString());
      removeDate(data.results![index].releaseDate.toString());
      removeOver(data.results![index].overview.toString());
    }

    ///Adding items on click that's not in the Favorite List
    else {
      addImage(data.results![index].posterPath.toString());
      addTitle(data.results![index].title.toString());
      addLang(data.results![index].originalLanguage.toString());
      addDate(data.results![index].originalLanguage.toString());
      addOver(data.results![index].overview.toString());
    }
    loading.value = false;
  }

  getFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loading.value = true;

    ///fetching data from Shared Preference in a list
    favouriteImage =
        RxList<String>.from(prefs.getStringList('Image')?.toList() ?? []);
    favouriteTitle =
        RxList<String>.from(prefs.getStringList('Title')?.toList() ?? []);
    favouriteLang =
        RxList<String>.from(prefs.getStringList('Lang')?.toList() ?? []);
    favouriteDate =
        RxList<String>.from(prefs.getStringList('Date')?.toList() ?? []);
    favouriteOver =
        RxList<String>.from(prefs.getStringList('Over')?.toList() ?? []);
    loading.value = false;
  }
}
