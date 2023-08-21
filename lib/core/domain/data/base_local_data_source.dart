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

  init() async {
    final watch = Stopwatch()..start();
    await exec();
    getIt<Logger>().debug('elapsed time of init: ${watch.elapsed.inSeconds}');
  }

  exec() {}
}