import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../device/domain/entity/device_entity.dart';

class HomeDeviceTile extends StatelessWidget {
  const HomeDeviceTile({
    super.key,
    required this.device,
  });

  final DeviceEntity device;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
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
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                device.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                device.macAddress,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: KAppColors.textPrimary.withValues(alpha: 0.4),
                      ),
                  children: [
                    const TextSpan(
                      text: "Last Used: ",
                    ),
                    TextSpan(
                      text: DateFormat.yMMMd().format(DateTime.now()),
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
    );
  }
}
