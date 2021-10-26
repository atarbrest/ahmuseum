import 'package:ahmuseum/data/repositories/collection_repository.dart';
import 'package:ahmuseum/data/repositories/details_repository.dart';
import 'package:ahmuseum/data/services/collection_service.dart';
import 'package:ahmuseum/data/services/details_service.dart';
import 'package:ahmuseum/domain/blocs/base/base_bloc.dart';
import 'package:ahmuseum/domain/blocs/collection/collection_bloc.dart';
import 'package:ahmuseum/domain/blocs/details/details_bloc.dart';
import 'package:ahmuseum/domain/services/dialog_service.dart';

import 'package:get_it/get_it.dart';

class ServiceLocator {
  static final I = ServiceLocator._();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  ServiceLocator._();

  Future init() async {
    _registerServices();
    _registerRepositories();
    _registerBlocs();
  }

  void _registerServices() {
    _getIt
      ..registerSingleton<DialogService>(
        DialogService(),
      )
      ..registerSingleton<CollectionService>(
        CollectionService(),
      )
      ..registerSingleton<DetailsService>(
        DetailsService(),
      );
  }

  void _registerRepositories() {
    _getIt
      ..registerSingleton<CollectionRepository>(
        CollectionRepository(
          get<CollectionService>(),
        ),
      )
      ..registerSingleton<DetailsRepository>(
        DetailsRepository(
          get<DetailsService>(),
        ),
      );
  }

  void _registerBlocs() {
    BaseBloc.initialize(get<DialogService>());
    _getIt
      ..registerFactory(
        () => CollectionBloc(
          get<CollectionRepository>(),
        ),
      )
      ..registerFactory(
        () => DetailsBloc(
          get<DetailsRepository>(),
        ),
      );
  }
}
