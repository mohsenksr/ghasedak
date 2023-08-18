import 'package:ghasedak/core/domain/data/base_local_data_source.dart';

abstract class Repository<T extends LocalDataSource, E> {
  T localDataSource;
  E? remoteDataSource;

  Repository(this.localDataSource, this.remoteDataSource);
}
