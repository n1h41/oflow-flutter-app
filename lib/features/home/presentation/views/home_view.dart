import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mqtt5_client/mqtt5_client.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utils/popup/loaders.dart';
import '../../../device/domain/entity/device_entity.dart';
import '../../../device/presentation/bloc/device_bloc.dart';
import '../../../device/presentation/bloc/device_state.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../widgets/add_device_popup.dart';
import '../widgets/home_device_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<DeviceEntity> deviceList = [];

  @override
  void initState() {
    super.initState();
    _initMqttClient();
    _loadDeviceList();
    _attachIotPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: Amplify.Auth.fetchUserAttributes(),
                builder: (context, snapshot) {
                  String? firstName;
                  if (snapshot.hasData) {
                    snapshot.data?.forEach((element) {
                      if (element.userAttributeKey.key == "custom:first_name") {
                        firstName = element.value;
                      }
                    });
                  }
                  return RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.titleLarge,
                      children: [
                        const TextSpan(text: "Hello! "),
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            !snapshot.hasData)
                          TextSpan(
                            style: TextStyle(
                              color:
                                  KAppColors.textPrimary.withValues(alpha: 0.4),
                            ),
                            text: "Loading...",
                          ),
                        if (snapshot.hasData) TextSpan(text: firstName ?? ""),
                      ],
                    ),
                  );
                }),
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Amplify.Auth.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "All Devices",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) => switch (state.status) {
                  HomeStateStatus.error => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: "Error: ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: KAppColors.textError
                                              .withValues(alpha: 0.8),
                                        ),
                                  ),
                                  TextSpan(
                                    text: state.error.toString(),
                                    style: const TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: _retryHandler,
                              child: Text(
                                "Retry",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: KAppColors.textWhite,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  HomeStateStatus.loading => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  HomeStateStatus.data || HomeStateStatus.initial => state
                          .deviceList.isEmpty
                      ? Center(
                          child: Text(
                            "No devices found. Add a device to get started",
                            style: TextStyle(
                              color:
                                  KAppColors.textPrimary.withValues(alpha: 0.4),
                            ),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: state.deviceList.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemBuilder: (context, index) {
                            final device = state.deviceList[index];
                            return InkWell(
                              highlightColor:
                                  KAppColors.accent.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                              onTap: () =>
                                  handleDeviceListItemTap(state, index),
                              onLongPress: () => showModalBottomSheet(
                                context: context,
                                builder: (_) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Device Options",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: KAppColors.textPrimary
                                                  .withValues(alpha: 0.5),
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ListTile(
                                        title: Text(
                                          "Delete Device",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                        onTap: () {
                                          context
                                              .read<HomeBloc>()
                                              .deleteDevice(device.macAddress);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ListTile(
                                        title: Text(
                                          "Copy MAC Address",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                        onTap: () {
                                          _handlerCopyMacAddress(
                                            device.macAddress,
                                          );
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: HomeDeviceTile(device: device),
                            );
                          },
                        ),
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: KAppColors.accent,
        shape: const CircleBorder(),
        onPressed: () => _openAddDevicePopup(context),
        child: const Icon(Icons.add, color: KAppColors.textWhite),
      ),
    );
  }

  _openAddDevicePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AddDevicePopup(),
    );
  }

  void _loadDeviceList() {
    context.read<HomeBloc>().loadDevices();
  }

  void handleDeviceListItemTap(HomeState state, int index) {
    final deviceBloc = context.read<DeviceBloc>();
    final deviceBlocStateStatus = deviceBloc.state.status;
    if (deviceBlocStateStatus == DeviceStateStatus.loading &&
        deviceBloc.mqttConnectionStatus == MqttConnectionState.connecting) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please wait for the device to load",
          ),
          showCloseIcon: true,
        ),
      );
      return;
    }
    if (deviceBloc.mqttConnectionStatus == MqttConnectionState.disconnected) {
      final text = deviceBloc.state.status == DeviceStateStatus.error
          ? deviceBloc.state.errorMessage ?? "An error occurred"
          : "Please wait for the device to connect";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            text,
          ),
          showCloseIcon: true,
        ),
      );
      return;
    }
    context.go("/device/${state.deviceList[index].macAddress}");
  }

  void _attachIotPolicy() async {
    final AuthSession authSession = await Amplify.Auth.fetchAuthSession();
    final identityId = authSession.toJson()["identityId"];
    if (identityId == null) {
      if (mounted) {
        KLoaders.customToast(
          context,
          message: "Could not get identityId! Contact support.",
        );
      }
      return;
    }
    if (mounted) {
      context.read<HomeBloc>().attachIotPolicyToIdentity(
            identityId: identityId as String,
            policyName: "esp_p",
          );
    }
  }

  void _retryHandler() async {
    final AuthSession authSession = await Amplify.Auth.fetchAuthSession();
    if (!mounted) {
      return;
    }
    context.read<DeviceBloc>().initMqttClient(authSession);
    _loadDeviceList();
    _attachIotPolicy();
  }

  Future<void> _initMqttClient() async {
    final AuthSession authSession = await Amplify.Auth.fetchAuthSession();
    if (!mounted) {
      return;
    }
    await context.read<DeviceBloc>().initMqttClient(authSession);
  }

  void _handlerCopyMacAddress(String macAddress) async {
    await Clipboard.setData(ClipboardData(text: macAddress));
  }
}
