import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oflow/core/constants/colors.dart';
import 'package:oflow/features/home/presentation/bloc/home_bloc.dart';
import 'qr_scanner_widget.dart';

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
          constraints: const BoxConstraints(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Enter Device MAC Address",
                          style: TextStyle(fontSize: 12),
                        ),
                        TextButton.icon(
                          onPressed: _openQRScanner,
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            size: 16,
                            color: KAppColors.accent,
                          ),
                          label: const Text(
                            "Scan QR",
                            style: TextStyle(
                              fontSize: 12,
                              color: KAppColors.accent,
                            ),
                          ),
                        ),
                      ],
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
                          hintText: "MAC Address or scan QR code",
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          suffixIcon: _macAddressController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear, size: 20),
                                  onPressed: () {
                                    _macAddressController.clear();
                                    setState(() {});
                                  },
                                )
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter Device Name",
                        style:
                            TextStyle(fontSize: 12), // or use Theme if needed
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

  void _openQRScanner() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QRScannerWidget(
          onQRCodeDetected: _handleQRCodeDetected,
          onClose: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  void _handleQRCodeDetected(String qrData) {
    Navigator.of(context).pop(); // Close scanner

    // Parse QR data - it might contain JSON or just the MAC address
    String macAddress = _extractMacAddressFromQRData(qrData);

    if (macAddress.isNotEmpty) {
      setState(() {
        _macAddressController.text = macAddress;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("MAC Address detected: $macAddress"),
          backgroundColor: KAppColors.accent,
          showCloseIcon: true,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No valid MAC Address found in QR code"),
          showCloseIcon: true,
        ),
      );
    }
  }

  String _extractMacAddressFromQRData(String qrData) {
    // Try different patterns to extract MAC address from QR data

    // Pattern 1: Direct MAC address (12 hex characters)
    RegExp directMacRegex = RegExp(r'[A-Fa-f0-9]{12}');
    Match? directMatch = directMacRegex.firstMatch(qrData);
    if (directMatch != null) {
      return directMatch.group(0)!.toUpperCase();
    }

    // Pattern 2: MAC address with colons or hyphens (AA:BB:CC:DD:EE:FF or AA-BB-CC-DD-EE-FF)
    RegExp colonMacRegex = RegExp(r'([A-Fa-f0-9]{2}[:-]){5}[A-Fa-f0-9]{2}');
    Match? colonMatch = colonMacRegex.firstMatch(qrData);
    if (colonMatch != null) {
      return colonMatch.group(0)!.replaceAll(RegExp(r'[:-]'), '').toUpperCase();
    }

    // Pattern 3: Try to parse as JSON and look for mac, macAddress, or deviceId fields
    try {
      if (qrData.startsWith('{') && qrData.endsWith('}')) {
        // Simple JSON-like parsing for common fields
        final jsonPatterns = [
          RegExp(r'"mac"\s*:\s*"([A-Fa-f0-9:-]{12,17})"'),
          RegExp(r'"macAddress"\s*:\s*"([A-Fa-f0-9:-]{12,17})"'),
          RegExp(r'"deviceId"\s*:\s*"([A-Fa-f0-9:-]{12,17})"'),
          RegExp(r'"device_mac"\s*:\s*"([A-Fa-f0-9:-]{12,17})"'),
        ];

        for (RegExp pattern in jsonPatterns) {
          Match? match = pattern.firstMatch(qrData);
          if (match != null) {
            String mac = match.group(1)!.replaceAll(RegExp(r'[:-]'), '');
            if (mac.length == 12) {
              return mac.toUpperCase();
            }
          }
        }
      }
    } catch (e) {
      // If JSON parsing fails, continue with other methods
    }

    return '';
  }

  void _handleAddDevice() async {
    final deviceMac = _macAddressController.text.trim();
    RegExp macAddressRegex = RegExp(r'^[A-Fa-f0-9]{12}$');
    if (!macAddressRegex.hasMatch(deviceMac)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid MAC Address (12 hex characters)"),
          showCloseIcon: true,
        ),
      );
      return;
    }
    final deviceName = _deviceNameController.text.trim();
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
