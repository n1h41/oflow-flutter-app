import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/colors.dart';

class DeviceTile extends StatelessWidget {
  final String title;
  final String icon;
  final void Function()? onTap;

  const DeviceTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: KAppColors.borderPrimary,
              ),
            ),
            child: CircleAvatar(
              radius: 42,
              backgroundColor: KAppColors.containerBackground,
              // child: Icon(Icons.timer),
              child: SvgPicture.asset(
                width: 30,
                height: 30,
                icon,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
