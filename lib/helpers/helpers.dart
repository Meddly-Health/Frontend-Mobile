import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'assets_provider.dart';
import '../theme/theme.dart';

Widget? showCheckIcon(
    bool isValid, String? errorMessage, BuildContext context) {
  if (isValid && errorMessage == null) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ZoomIn(
          duration: const Duration(milliseconds: 200),
          child: SvgPicture.asset(
            AssetsProvider.valid,
            color: Theme.of(context).colorScheme.validColor,
          )),
    );
  }
  return null;
}