import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<SwitchOffEvent>((event, emit) {
      emit(const SwitchState(isDarkTheme: false));
    });
    on<SwitchOnEvent>((event, emit) {
      emit(const SwitchState(isDarkTheme: true));
    });
  }
}
