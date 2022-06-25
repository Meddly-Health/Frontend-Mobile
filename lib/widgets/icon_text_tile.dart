import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/helpers/assets_provider.dart';

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
          Container(
              width: 45,
              height: 45,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                asset,
                color: color,
                height: 23,
                width: 23,
              )),
          const SizedBox(width: 16),
          Expanded(
            child: AutoSizeText(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: color, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(
            AssetsProvider.chevron,
            height: 15,
          ),
        ],
      ),
    );
  }
}
