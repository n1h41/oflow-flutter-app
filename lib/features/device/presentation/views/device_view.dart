// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mqtt5_client/mqtt5_client.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../domain/entity/device_status_entity.dart';
import '../bloc/device_bloc.dart';
import '../bloc/device_state.dart';
import '../mixins/mqtt_mixin.dart';
import '../widgets/device_tile.dart';
import '../widgets/power_setting_bottom_sheet.dart';
import '../widgets/timer_bottom_sheet.dart';

class DeviceView extends StatefulWidget {
  final String deviceMac;

  const DeviceView({
    super.key,
    required this.deviceMac,
  });

  @override
  State<DeviceView> createState() => _DeviceViewState();
}

class _DeviceViewState extends State<DeviceView> with MqttMixin {
  late final ValueNotifier<bool> timerStatusNotifier;

  late final ValueNotifier<bool> isLoadingNotifier;

  @override
  void initState() {
    super.initState();
    timerStatusNotifier = ValueNotifier<bool>(false);
    isLoadingNotifier = ValueNotifier<bool>(true);
    context.read<DeviceBloc>().subscribeToTopic('C4DEE2879A60/status');
    context.read<DeviceBloc>().subscribeToTopic('C4DEE2879A60/pow');
    context.read<DeviceBloc>().subscribeToTopic('C4DEE2879A60/vals');
    context.read<DeviceBloc>().subscribeToTopic('C4DEE2879A60/chats');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeviceBloc, DeviceState>(
      listenWhen: (previous, current) =>
          previous.deviceStatus == null && current.deviceStatus != null,
      listener: (context, state) {
        context.read<DeviceBloc>().publishToTopic(
              'C4DEE2879A60/status',
              jsonEncode(state.deviceStatus!.copyWith(o: '0').toJson()),
              qosLevel: MqttQos.atMostOnce,
            );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: KAppColors.containerBackground,
                    boxShadow: [
                      BoxShadow(
                        color: KAppColors.shadowColor.withOpacity(0.1),
                        blurRadius: 14,
                        spreadRadius: 0,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    backgroundColor: KAppColors.containerBackground,
                    radius: 20,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "Motor",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DeviceTile(
                      title: "Schedule",
                      icon: KAppAssets.schedule,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Feature coming soon"),
                            showCloseIcon: true,
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: DeviceTile(
                      title: "History",
                      icon: KAppAssets.history,
                      onTap: () {
                        context.go('/device/${widget.deviceMac}/history');
                      },
                    ),
                  ),
                  Expanded(
                    child: DeviceTile(
                      title: "Timer",
                      icon: KAppAssets.circledPower,
                      onTap: () => showModalBottomSheet<void>(
                        context: context,
                        builder: (context) => const TimerBottomSheet(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DeviceTile(
                      title: "Power Settings",
                      icon: KAppAssets.settings,
                      onTap: () => showModalBottomSheet<void>(
                        context: context,
                        builder: (context) => const PowerSettingBottomSheet(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 66,
                ),
                decoration: const BoxDecoration(
                  color: KAppColors.containerBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Setted Time",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              BlocBuilder<DeviceBloc, DeviceState>(
                                builder: (context, state) {
                                  return Text(
                                    getDeviceTimerValue(state),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                          color: KAppColors.borderPrimary,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Status",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              BlocBuilder<DeviceBloc, DeviceState>(
                                builder: (context, state) {
                                  return Text(
                                    DeviceStateStatus.loading == state.status
                                        ? "loading"
                                        : state.deviceStatus?.o == "1"
                                            ? "Online"
                                            : "Offline",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Voltage",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              BlocBuilder<DeviceBloc, DeviceState>(
                                builder: (context, state) {
                                  return RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: state.devicePowerDetails?.v
                                              .toString(),
                                        ),
                                        TextSpan(
                                          text: " V",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                          color: KAppColors.borderPrimary,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Amperage",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              BlocBuilder<DeviceBloc, DeviceState>(
                                builder: (context, state) {
                                  return RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: state.devicePowerDetails?.a
                                              .toString(),
                                        ),
                                        TextSpan(
                                          text: " A",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: KAppColors.borderPrimary,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 218,
                              height: 218,
                              decoration: BoxDecoration(
                                color: KAppColors.textWhite,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: KAppColors.accent.withOpacity(0.1),
                                    blurRadius: 16,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 9),
                                  ),
                                ],
                              ),
                              child: BlocBuilder<DeviceBloc, DeviceState>(
                                  builder: (context, state) {
                                return Center(
                                  child: InkWell(
                                    onTap: _handlerPowerButtonOnTap,
                                    child: Container(
                                      width: 190,
                                      height: 190,
                                      decoration: BoxDecoration(
                                        color: state.deviceStatus?.p == "1"
                                            ? KAppColors.accent
                                            : KAppColors.containerBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: KAppColors.borderPrimary,
                                        ),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          KAppAssets.power,
                                          color: state.deviceStatus?.p == "1"
                                              ? KAppColors.textWhite
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          child: BlocBuilder<DeviceBloc, DeviceState>(
                            builder: (context, state) {
                              return Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: state.deviceStatus?.p == "1"
                                      ? KAppColors.accent.withOpacity(0.8)
                                      : KAppColors.containerBackgroundDark
                                          .withOpacity(0.2),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDeviceTimerValue(DeviceState state) {
    if (state.deviceValueDetails == null) {
      return '00 min';
    }
    final timerValueInMins = int.tryParse(state.deviceValueDetails!.offTime);
    if (timerValueInMins == null) {
      return '00 min';
    }
    if (timerValueInMins < 60) {
      return '${timerValueInMins.toString().padLeft(2, "0")} min';
    }
    final hours = timerValueInMins ~/ 60;
    final minutes = timerValueInMins % 60;
    return '${hours.toString().padLeft(2, "0")} : ${minutes.toString().padLeft(2, "0")}';
  }

  void _handlerPowerButtonOnTap() {
    final isDeviceOnline =
        context.read<DeviceBloc>().state.deviceStatus?.o == "1";
    if (!isDeviceOnline) {
      return;
    }
    final currentPowerStatus =
        context.read<DeviceBloc>().state.deviceStatus?.p == "1";
    if (currentPowerStatus) {
      context.read<DeviceBloc>().publishToTopic('C4DEE2879A60/status',
          jsonEncode(const DeviceStatusEntity(p: "0", o: "1").toJson()));
    } else {
      context.read<DeviceBloc>().publishToTopic('C4DEE2879A60/status',
          jsonEncode(const DeviceStatusEntity(p: "1", o: "1").toJson()));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
