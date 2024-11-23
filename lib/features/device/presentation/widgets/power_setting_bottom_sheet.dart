import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors.dart';
import '../../domain/entity/vals_entity.dart';
import '../bloc/device_bloc.dart';

class PowerSettingBottomSheet extends StatefulWidget {
  const PowerSettingBottomSheet({super.key});

  @override
  State<PowerSettingBottomSheet> createState() =>
      _PowerSettingBottomSheetState();
}

class _PowerSettingBottomSheetState extends State<PowerSettingBottomSheet> {
  late final TextEditingController _minVoltageController;
  late final TextEditingController _minCurrentController;
  late final TextEditingController _maxCurrentController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _minVoltageController = TextEditingController();
    _minCurrentController = TextEditingController();
    _maxCurrentController = TextEditingController();
    _preloadValues();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 480,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Power Settings",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Min Voltage",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 10),
                    // create textformfiled with height of 50
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: KAppColors.borderPrimary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _minVoltageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter min voltage",
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Min Current",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 10),
                    // create textformfiled with height of 50
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: KAppColors.borderPrimary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _minCurrentController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter min current",
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Max Current",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 10),
                    // create textformfiled with height of 50
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: KAppColors.borderPrimary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _maxCurrentController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter max current",
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handlerUpdatePowerSettings,
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }

  void _handlerUpdatePowerSettings() {
    ValsEntity? currentPowerState =
        context.read<DeviceBloc>().state.deviceValueDetails;
    if (currentPowerState == null) {
      return;
    }
    final minVoltage = _minVoltageController.text;
    final minCurrent = _minCurrentController.text;
    final maxCurrent = _maxCurrentController.text;
    if (_formKey.currentState!.validate()) {
      if (minVoltage.isNotEmpty) {
        currentPowerState = currentPowerState.copyWith(minVolt: minVoltage);
      }
      if (minCurrent.isNotEmpty) {
        currentPowerState = currentPowerState.copyWith(minCurrent: minCurrent);
      }
      if (maxCurrent.isNotEmpty) {
        currentPowerState = currentPowerState.copyWith(maxCurrent: maxCurrent);
      }
      context.read<DeviceBloc>().publishToTopic(
            "C4DEE2879A60/vals",
            jsonEncode(currentPowerState.toJson()),
          );
    }
    context.pop();
  }

  void _preloadValues() {
    final ValsEntity? currentPowerState =
        context.read<DeviceBloc>().state.deviceValueDetails;
    if (currentPowerState != null) {
      _minVoltageController.text = currentPowerState.minVolt;
      _minCurrentController.text = currentPowerState.minCurrent;
      _maxCurrentController.text = currentPowerState.maxCurrent;
    }
  }
}
