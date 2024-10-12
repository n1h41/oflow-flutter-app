import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class PowerSettingBottomSheet extends StatelessWidget {
  const PowerSettingBottomSheet({super.key});

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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}
