part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  const SwitchState({this.isDarkTheme = false});
  final bool isDarkTheme;

  @override
  List<Object> get props => [isDarkTheme];
}
