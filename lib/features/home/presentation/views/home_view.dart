import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mqtt5_client/mqtt5_client.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/local_storage/local_storage.dart';
import '../../../device/presentation/bloc/device_bloc.dart';
import '../../../device/presentation/bloc/device_state.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> deviceList = [];

  @override
  void initState() {
    super.initState();
    context.read<DeviceBloc>().initMqttClient();
    _loadDeviceList();
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
                              color: KAppColors.textPrimary.withOpacity(0.4),
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
                        HomeStateStatus.data || HomeStateStatus.initial => state
                                .deviceList.isEmpty
                            ? Center(
                                child: Text(
                                  "No devices found. Add a device to get started",
                                  style: TextStyle(
                                    color:
                                        KAppColors.textPrimary.withOpacity(0.4),
                                  ),
                                ),
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                itemCount: state.deviceList.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 20,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                  highlightColor: KAppColors.accent.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () =>
                                      handleDeviceListItemTap(state, index),
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 0,
                                          blurRadius: 11,
                                          offset: const Offset(
                                            0,
                                            0,
                                          ), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: KAppColors.accent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Cropton Motor',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: KAppColors
                                                          .textPrimary
                                                          .withOpacity(0.4),
                                                    ),
                                                children: [
                                                  const TextSpan(
                                                    text: "Last Used: ",
                                                  ),
                                                  TextSpan(
                                                    text: DateFormat.yMMMd()
                                                        .format(DateTime.now()),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: KAppColors.accent,
                                          child: SvgPicture.asset(
                                            KAppAssets.neArrow,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        _ => const SizedBox.shrink(),
                      }),
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
    // Open the add device popup
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
    context.go("/device/${state.deviceList[index]}");
  }
}

class AddDevicePopup extends StatefulWidget {
  const AddDevicePopup({super.key});

  @override
  State<AddDevicePopup> createState() => _AddDevicePopupState();
}

class _AddDevicePopupState extends State<AddDevicePopup> {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier(false);

  final TextEditingController _macAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder(
          valueListenable: _isLoadingNotifier,
          builder: (context, isLoading, _) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Scan QR Code",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: KAppColors.textWhite,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const Text("OR"),
                const SizedBox(height: 10),
                Text(
                  "Enter Device MAC Address",
                  style: Theme.of(context).textTheme.labelSmall,
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
                    controller: _macAddressController,
                    decoration: InputDecoration(
                      hintText: "MAC Address",
                      hintStyle: Theme.of(context).textTheme.labelSmall,
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleAddDevice,
                    child: Text(
                      "Add +",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: KAppColors.textWhite,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _isLoadingNotifier.dispose();
    super.dispose();
  }

  void _handleAddDevice() async {
    final deviceMac = _macAddressController.text;
    RegExp macAddressRegex = RegExp(r'^[A-z0-9]{12}$');
    if (!macAddressRegex.hasMatch(deviceMac)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid MAC Address"),
          showCloseIcon: true,
        ),
      );
      return;
    }
    _isLoadingNotifier.value = true;
    // Add device mac to shared preferences
    await Future.delayed(const Duration(seconds: 2));
    final currentDeviceList = LocalStorage.instance.getStringList("devices") ??
        <String>[]; // get the current device list
    currentDeviceList.add(deviceMac); // add the new device mac
    await LocalStorage.instance.saveStringList("devices", currentDeviceList);
    _isLoadingNotifier.value = false;
    if (mounted) {
      context.read<HomeBloc>().loadDevices();
      context.pop();
    }
  }
}
