import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parctice2_app/blocs/switch_bloc/switch_bloc.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(
      builder: (context, state) {
        return Switch(
          value: state.isDarkTheme,
          activeColor: Colors.deepPurple,
          inactiveThumbColor: Colors.grey[800],
          onChanged: (val) {
            val
                ? context.read<SwitchBloc>().add(const SwitchOnEvent())
                : context.read<SwitchBloc>().add(const SwitchOffEvent());
          },
        );
      },
    );
  }
}
