import 'package:ghasedak/core/domain/data/base_local_data_source.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class MainLocalDataSource extends LocalDataSource {
  static const String tokenBox = "token";


  @override
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
