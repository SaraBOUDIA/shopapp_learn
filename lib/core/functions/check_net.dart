import 'dart:io';

Future<bool?> checkInternet() async {
  return await InternetAddress.lookup('google.com').then((value) {
    if (value.isNotEmpty && value[0].rawAddress.isNotEmpty) {
      return true;
    }
  }).catchError((error) {
    return false;
  });
}
