import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:user_repository/user_repository.dart';

import '../theme/theme.dart';
import 'assets_provider.dart';

Widget showCheckIcon(bool isValid, BuildContext context) {
  if (isValid) {
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
  return Container();
}

String formatDate(DateTime date) {
  return '${date.day} de ${getMonthName(date.month)} de ${date.year}';
}

var maskFormatter = MaskTextInputFormatter(
    mask: "###-####-###'",
    filter: {'#': RegExp(r'[A-Z0-9]')},
    type: MaskAutoCompletionType.lazy);

String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'Enero';
    case 2:
      return 'Febrero';
    case 3:
      return 'Marzo';
    case 4:
      return 'Abril';
    case 5:
      return 'Mayo';
    case 6:
      return 'Junio';
    case 7:
      return 'Julio';
    case 8:
      return 'Agosto';
    case 9:
      return 'Septiembre';
    case 10:
      return 'Octubre';
    case 11:
      return 'Noviembre';
    case 12:
      return 'Diciembre';
    default:
      return '';
  }
}

String getAvatarAsset(Color? skinColor, Color? hairColor, Sex? sex) {
  if (skinColor == null && hairColor == null) {
    return AssetsProvider.defaultAvatar;
  }

  int hair = 0;
  int skin = 0;

  if (skinColor == lightSkin) {
    skin = 1;
  }
  if (skinColor == mediumSkin) {
    skin = 2;
  }
  if (skinColor == darkSkin) {
    skin = 3;
  }
  if (hairColor == brunette) {
    hair = 1;
  }
  if (hairColor == brown) {
    hair = 2;
  }
  if (hairColor == blonde) {
    hair = 3;
  }

  return 'assets/avatar/avatar$hair-$skin.svg';
}
