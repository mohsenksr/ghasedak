import 'package:bloc/bloc.dart';
import '../../errors/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'alert_handler_state.dart';

@singleton
class AlertHandlerCubit extends Cubit<AlertHandlerState> {
  AlertHandlerCubit() : super(FailureFreeState());

  raise(Alert failure, {int duration = 1}) async {
    emit(FailureOccurred(failure));
    await new Future.delayed(Duration(seconds: duration));
    emit(FailureFreeState());
  }

  info(Alert message, {int duration = 1}) async {
    emit(InfoState(message));
    await new Future.delayed(Duration(seconds: duration));
    emit(FailureFreeState());
  }
}
