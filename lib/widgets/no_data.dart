import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/assets_provider.dart';

class NoData extends StatelessWidget {
  const NoData({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset(AssetsProvider.openBox),
        const SizedBox(height: 16),
        Text(message, style: Theme.of(context).textTheme.bodyMedium),
        const Spacer(),
      ],
    );
  }
}
