import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oflow/core/constants/assets.dart';
import 'package:oflow/core/constants/colors.dart';
import 'package:oflow/features/device/presentation/widgets/power_setting_bottom_sheet.dart';

import '../widgets/device_tile.dart';
import '../widgets/timer_bottom_sheet.dart';

class DeviceView extends StatefulWidget {
  const DeviceView({super.key});

  @override
  State<DeviceView> createState() => _DeviceViewState();
}

class _DeviceViewState extends State<DeviceView> {
  late final ValueNotifier<bool> timerStatusNotifier;

  @override
  void initState() {
    super.initState();
    timerStatusNotifier = ValueNotifier<bool>(false);
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
                    context.go('/device/schedule');
                  },
                ),
                DeviceTile(
                  title: "History",
                  icon: KAppAssets.history,
                  onTap: () {
                    context.go('/device/history');
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
                            Text(
                              "Offline",
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
                                valueListenable: timerStatusNotifier,
                                builder: (context, timerStatus, _) {
                                  return Center(
                                    child: InkWell(
                                      onTap: () {
                                        timerStatusNotifier.value =
                                            !timerStatus;
                                      },
                                      child: Container(
                                        width: 190,
                                        height: 190,
                                        decoration: BoxDecoration(
                                          color: timerStatus
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
                                            color: timerStatus
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
    );
  }
}
