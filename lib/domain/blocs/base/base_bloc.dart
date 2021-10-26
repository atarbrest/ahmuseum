import 'dart:async';

import 'package:ahmuseum/data/services/base_service.dart';
import 'package:ahmuseum/domain/services/dialog_service.dart';
import 'package:ahmuseum/domain/view_models/error_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_event.dart';
part 'base_state.dart';

late DialogService _dialogService;

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  static void initialize(DialogService dialogService) {
    _dialogService = dialogService;
  }

  DialogService get dialogService => _dialogService;

  BaseBloc(initialState) : super(initialState);

  Future makeExecution<T>({
    required Future<T> Function() function,
    FutureOr<void> Function(T value)? onSuccess,
    FutureOr<void> Function()? onError,
  }) async {
    try {
      final result = await function.call();

      if (onSuccess != null) {
        await onSuccess(result);
      }
    } on InternalServerException catch (ex) {
      await handleExecutionException(
        ex: ex,
        shouldShowError: true,
        onError: onError,
      );
    } on NotFoundServiceException catch (ex) {
      await handleExecutionException(
        ex: ex,
        shouldShowError: true,
        onError: onError,
        errorViewModel: GeneralErrorViewModel(
          title: 'Not found',
          description:
              'Unfortunately selected item does not found. Try again later.',
          actionTitle: 'Ok',
        ),
      );
    } on UnhandledServiceException catch (ex) {
      await handleExecutionException(
        ex: ex,
        shouldShowError: true,
        onError: onError,
      );
    } catch (ex) {
      await handleExecutionException(
        ex: ex,
        shouldShowError: true,
        onError: onError,
      );
    }
  }

  Future<void> handleExecutionException({
    required dynamic ex,
    required bool shouldShowError,
    FutureOr<void> Function()? onError,
    GeneralErrorViewModel? errorViewModel,
  }) async {
    if (onError != null) {
      await onError();
    }

    if (shouldShowError) {
      await dialogService.showErrorDialog(
        errorViewModel ?? GeneralErrorViewModel(),
      );
    }
  }
}
