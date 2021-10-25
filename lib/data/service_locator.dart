import 'package:ahmuseum/data/repositories/collection_repository.dart';
import 'package:ahmuseum/data/services/collection_service.dart';
import 'package:ahmuseum/domain/blocs/collection_bloc.dart';

import 'package:get_it/get_it.dart';

class ServiceLocator {
  static final I = ServiceLocator._();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  ServiceLocator._();

  Future init() async {
    _getIt.registerSingleton<CollectionService>(
      CollectionService(),
    );

    _getIt
      ..registerSingleton<CollectionRepository>(
        CollectionRepository(
          get<CollectionService>(),
        ),
      )
      ..registerFactory(
        () => CollectionBloc(
          get<CollectionRepository>(),
        ),
      );
  }
}
