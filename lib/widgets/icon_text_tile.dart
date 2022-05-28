import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconAndTextTileItem extends StatelessWidget {
  const IconAndTextTileItem({
    Key? key,
    required this.label,
    required this.asset,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(asset),
          const SizedBox(width: 16),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
