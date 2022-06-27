import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/helpers/assets_provider.dart';
import 'dart:math';

import 'package:meddly/helpers/constants.dart';

class MeddlyBackButton extends StatelessWidget {
  const MeddlyBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: -pi,
        child: GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            AutoRouter.of(context).pop();
          },
          child: Container(
            height: 56,
            width: 56,
            padding: defaultPadding,
            child: SvgPicture.asset(
              AssetsProvider.chevron,
              height: 18,
              width: 18,
            ),
          ),
        ));
  }
}
