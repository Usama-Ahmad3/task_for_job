import 'package:connectivity_plus/connectivity_plus.dart';

class InternetCheck {
  Future<bool> connectivityCheck() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile) {
      return true;
    } else if (result == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
