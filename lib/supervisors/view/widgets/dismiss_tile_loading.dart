import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../helpers/assets_provider.dart';

class DismissTileLoading extends StatelessWidget {
  const DismissTileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                color: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: SvgPicture.asset(
                      AssetsProvider.defaultAvatar,
                    ),
                  ),
                ))),
        const SizedBox(height: 16),
        Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                color: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: SvgPicture.asset(
                      AssetsProvider.defaultAvatar,
                    ),
                  ),
                ))),
        const SizedBox(height: 16),
        Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                color: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: SvgPicture.asset(
                      AssetsProvider.defaultAvatar,
                    ),
                  ),
                ))),
      ],
    );
  }
}

//  Colors.grey[200],
//             Color(0xFFF4F4F4),
//             Color(0xFFEBEBF4),