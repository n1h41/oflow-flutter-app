import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

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
    if (_formKey.currentState!.validate()) {
      // call the api to update power settings
    }
  }
}
