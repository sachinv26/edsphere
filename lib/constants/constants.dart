import 'package:schoolapp/data/apiClient/getstudent.dart';

class Constants {
  static String createOrderUrl = "https://api.razorpay.com/v1/orders";
  static String keySecret = "${AuthenticateUser.appSetting!.key2.toString()}";
  static String keyId = "${AuthenticateUser.appSetting!.key1.toString()}";
  static String upiid = "${AuthenticateUser.appSetting!.key3.toString()}";
}

// static const String baseAssetPath = "assets/";
// static const String dummyAvatar = "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200";
// static const String baseApiUrl = "";