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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          highlightColor: KAppColors.accent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(36),
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: KAppColors.containerBackground,
              shape: BoxShape.circle,
              border: Border.all(
                color: KAppColors.borderPrimary,
              ),
            ),
            child: Center(
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
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
