import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oflow/core/constants/colors.dart';
import 'package:oflow/features/home/presentation/bloc/home_bloc.dart';

class AddDevicePopup extends StatefulWidget {
  const AddDevicePopup({super.key});

  @override
  State<AddDevicePopup> createState() => _AddDevicePopupState();
}

class _AddDevicePopupState extends State<AddDevicePopup> {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier(false);

  final TextEditingController _macAddressController = TextEditingController();
  final TextEditingController _deviceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder(
          valueListenable: _isLoadingNotifier,
          builder: (context, isLoading, _) {
            if (isLoading) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                ],
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter Device MAC Address",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                const SizedBox(height: 10),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter Device Name",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: KAppColors.borderPrimary,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _deviceNameController,
                    decoration: InputDecoration(
                      hintText: "eg. Pump",
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
    final deviceName = _deviceNameController.text;
    if (deviceName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a device name"),
          showCloseIcon: true,
        ),
      );
      return;
    }
    _isLoadingNotifier.value = true;
    context.read<HomeBloc>().addDevice(deviceMac, deviceName).then((_) {
      _isLoadingNotifier.value = false;
      if (mounted) {
        context.read<HomeBloc>().loadDevices();
        context.pop();
      }
    });
  }
}
