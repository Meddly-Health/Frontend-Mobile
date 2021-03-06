import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import '../helpers/assets_provider.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key, required this.title, this.onPop})
      : super(key: key);

  final String title;
  final Function? onPop;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              HapticFeedback.lightImpact();
              if (onPop != null) {
                await onPop!();
              }
              AutoRouter.of(context).pop();
            },
            child: Container(
              height: 48,
              width: 48,
              alignment: Alignment.centerLeft,
              child: Transform.rotate(
                  angle: -math.pi,
                  child: SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(AssetsProvider.chevron))),
            ),
          ),
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
