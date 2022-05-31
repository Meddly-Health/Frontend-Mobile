import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconAndTextTileItem extends StatelessWidget {
  const IconAndTextTileItem(
      {Key? key,
      required this.label,
      required this.asset,
      required this.onTap,
      this.color})
      : super(key: key);

  final String label;
  final String asset;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Row(
        children: [
          SvgPicture.asset(asset, color: color),
          const SizedBox(width: 16),
          Text(
            label,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
