import 'package:url_launcher/url_launcher.dart';

class Methods {
  static Future<void> openUrl(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception("Could not lauch $url");
      }
    } catch (e) {
      Uri.parse("Not a Valid Url");
    }
  }

  static String convertString(String valueProvider) {
    return valueProvider[0].toUpperCase() +
        valueProvider.substring(1).toLowerCase();
  }
}
