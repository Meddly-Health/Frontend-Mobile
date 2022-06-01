import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import '../helpers/assets_provider.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              HapticFeedback.lightImpact();
              AutoRouter.of(context).pop();
            },
            child: Transform.rotate(
                angle: -math.pi,
                child: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(AssetsProvider.chevron))),
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
