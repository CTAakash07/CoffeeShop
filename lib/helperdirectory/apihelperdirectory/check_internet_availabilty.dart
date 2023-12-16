import 'dart:io';
import 'package:flutter/foundation.dart';

class CheckConnectivity{
  static Future<bool> checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        return true;
      }else{
        return false;
      }
    } on SocketException {
      if (kDebugMode) {
      }
      return false;
    }
  }
}