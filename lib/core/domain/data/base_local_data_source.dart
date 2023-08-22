import 'dart:convert';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/core/utils/log_util.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalDataSource {
  static const String tokenBox = "token";

  init() async {
    final watch = Stopwatch()..start();
    await exec();
    getIt<Logger>().debug('elapsed time of init: ${watch.elapsed.inSeconds}');
  }

  exec() async {
    await Hive.openBox<String>(tokenBox);
  }

  Future<String?> getToken() async {
    final box = Hive.box<String>(tokenBox);
    return box.get("TOKEN");
  }

  setToken(String token) async {
    final box = await Hive.openBox<String>(tokenBox);
    box.put("TOKEN", token);
  }
}
