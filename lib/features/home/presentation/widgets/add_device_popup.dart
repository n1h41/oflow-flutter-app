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
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: FractionallySizedBox(
        widthFactor: MediaQuery.of(context).size.width < 600 ? 0.95 : 0.35,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 400,
            maxHeight: 500,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width < 600 ? 16 : 24,
              vertical: MediaQuery.of(context).size.width < 600 ? 16 : 24,
            ),
            child: ValueListenableBuilder(
              valueListenable: _isLoadingNotifier,
              builder: (context, isLoading, _) {
                if (isLoading) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter Device MAC Address",
                        style: TextStyle(fontSize: 12), // or use Theme if needed
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter Device Name",
                        style: TextStyle(fontSize: 12), // or use Theme if needed
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
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
