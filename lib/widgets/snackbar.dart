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
      return _getErrorSnackbar(context, message);

    case SnackBarType.success:
      return _getSuccessSnackbar(context, message);

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

SnackBar _getSuccessSnackbar(BuildContext context, String message) {
  return SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: Theme.of(context).colorScheme.validColor,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    content: Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.validColor),
      child: Row(
        children: [
          SizedBox(
              height: 21,
              width: 21,
              child: SvgPicture.asset(
                AssetsProvider.success,
                color: Theme.of(context).colorScheme.secondary,
              )),
          const SizedBox(width: 16),
          Expanded(
            child: AutoSizeText(message,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.secondary)),
          ),
        ],
      ),
    ),
  );
}

SnackBar _getErrorSnackbar(BuildContext context, String message) {
  return SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: Theme.of(context).colorScheme.error,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    content: Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.error),
      child: Row(
        children: [
          SizedBox(
              height: 21,
              width: 21,
              child: SvgPicture.asset(
                AssetsProvider.exclamation,
                color: Theme.of(context).colorScheme.secondary,
              )),
          const SizedBox(width: 16),
          Expanded(
            child: AutoSizeText(message,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.secondary)),
          ),
        ],
      ),
    ),
  );
}
