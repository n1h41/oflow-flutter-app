import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflow/features/home/presentation/bloc/home_bloc.dart';
import 'package:oflow/features/home/presentation/bloc/home_state.dart';

class MqttConnectionIndicatorWidget extends StatelessWidget {
  const MqttConnectionIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(right: 25),
        child: SizedBox(
          child: state.isMqttConnected
              ? const Icon(
                  Icons.wifi,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.wifi_off,
                  color: Colors.grey,
                ),
        ),
      ),
    );
  }
}
