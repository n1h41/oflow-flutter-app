// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:oflow/features/device/domain/entity/power_entity.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
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
  late final ValueNotifier<PowerEntity> statusDataNotifier;

  @override
  void initState() {
    super.initState();
    timerStatusNotifier = ValueNotifier<bool>(false);
    isLoadingNotifier = ValueNotifier<bool>(true);
    statusDataNotifier =
        ValueNotifier<PowerEntity>(const PowerEntity(p: "0", o: "0"));
    _initMqtt();
  }

  _initMqtt() async {
    await configureMqttClient();
    _listenForMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                DeviceTile(
                  title: "Schedule",
                  icon: KAppAssets.schedule,
                  onTap: () {
                    context.go('/device/${widget.deviceMac}/schedule');
                  },
                ),
                DeviceTile(
                  title: "History",
                  icon: KAppAssets.history,
                  onTap: () {
                    context.go('/device/${widget.deviceMac}/history');
                  },
                ),
                DeviceTile(
                  title: "On/Off Timer",
                  icon: KAppAssets.circledPower,
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (context) => const TimerBottomSheet(),
                  ),
                ),
                DeviceTile(
                  title: "Power Settings",
                  icon: KAppAssets.settings,
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (context) => const PowerSettingBottomSheet(),
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
                            Text(
                              "30 min",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
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
                            ValueListenableBuilder(
                                valueListenable: statusDataNotifier,
                                builder: (context, statusData, _) {
                                  return Text(
                                    statusData.o == "1" ? "Online" : "Offline",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  Column(
                    children: [
                      Text(
                        "Time",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        "00 : 00",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 75,
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
                            child: ValueListenableBuilder(
                                valueListenable: statusDataNotifier,
                                builder: (context, statusData, _) {
                                  return Center(
                                    child: InkWell(
                                      onTap: () {
                                        /* timerStatusNotifier.value =
                                            !timerStatus; */
                                      },
                                      child: Container(
                                        width: 190,
                                        height: 190,
                                        decoration: BoxDecoration(
                                          color: statusData.p == "1"
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
                                            color: statusData.p == "1"
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
                        child: ValueListenableBuilder(
                          valueListenable: timerStatusNotifier,
                          builder: (context, timerStatus, _) {
                            return Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: timerStatus
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: KAppColors.accent,
        shape: const CircleBorder(),
        onPressed: () {
          _checkIfDevicIsOnline();
        },
        child: SvgPicture.asset(KAppAssets.neArrow),
      ),
    );
  }

  @override
  void dispose() {
    client.unsubscribeStringTopic("${widget.deviceMac}/status");
    client.disconnect();
    super.dispose();
  }

  _listenForMessages() {
    client.updates.listen(
      (event) {
        for (var message in event) {
          isLoadingNotifier.value = true;
          MqttPublishMessage msg = message.payload as MqttPublishMessage;
          final pt = MqttUtilities.bytesToStringAsString(msg.payload.message!);
          debugPrint("MQTT Message: $pt");
          statusDataNotifier.value = PowerEntity.fromJson(jsonDecode(pt));
          isLoadingNotifier.value = false;
        }
      },
    );
    // INFO: Subscribe to the topic
    _subscribeToTopic();
  }

  _subscribeToTopic() {
    client.subscribe("${widget.deviceMac}/status", MqttQos.atLeastOnce);
  }

  _checkIfDevicIsOnline() {
    // INFO: Publish to the topic
    // conevert json string to uint8buffer
    final payload = MqttPayloadBuilder();
    payload.addString(jsonEncode(const PowerEntity(p: "1", o: "1").toJson()));
    final messageIdentifier = client.publishMessage(
      "${widget.deviceMac}/status",
      MqttQos.atLeastOnce,
      payload.payload!,
    );
    debugPrint("Message Identifier: $messageIdentifier");
  }
}
