import 'dart:async';

import 'package:flutter/services.dart';

class MobCompressVideo {
  static const MethodChannel _channel =
      const MethodChannel('mob_compress_video');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> compress(String origem, String destino) async {
    final String resultado = await _channel.invokeMethod('compress', <String, dynamic>{
        'origem': origem,
        'destino': destino
      });
    return resultado;
  }

   static Future<String> getPathTemp() async {
    final String resultado = await _channel.invokeMethod('getPathTemp');
    return resultado;
  }
}
