import '../errors/failures.dart';
import 'alert_handler/alert_handler_cubit.dart';
import 'injection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCubit<T> extends Cubit<T> {
  final AlertHandlerCubit alertHandler = getIt<AlertHandlerCubit>();

  CustomCubit(T initialState) : super(initialState);

  failureOrSuccess<T>(
      Either<Alert, T> result, Function successCb, Function failureCb) {
    result.fold((f) {
      handleFailure(f);
      failureCb(f);
    }, (r) => successCb(r));
  }

  handleFailure(Alert failure) {
    alertHandler.raise(failure);
  }
}
