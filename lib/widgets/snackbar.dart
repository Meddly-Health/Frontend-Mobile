import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/theme/theme.dart';

import '../helpers/assets_provider.dart';

enum SnackBarType { error, success, warning, loading }

SnackBar getSnackBar(BuildContext context, String message, SnackBarType type,
    [Duration duration = const Duration(seconds: 4),
    dismissDirection = DismissDirection.down]) {
  switch (type) {
    case SnackBarType.error:
      return SnackBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: duration,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  AssetsProvider.exclamation,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AutoSizeText(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ));
    case SnackBarType.success:
      return SnackBar(
        content: Container(),
      );

    case SnackBarType.warning:
      return SnackBar(
        content: Container(),
      );
    case SnackBarType.loading:
      return SnackBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: defaultPadding,
          backgroundColor: Theme.of(context).colorScheme.validColor,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  'Iniciando Sesión...',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .validColor
                        .withOpacity(0.2),
                    strokeWidth: 2,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ));
  }
}
