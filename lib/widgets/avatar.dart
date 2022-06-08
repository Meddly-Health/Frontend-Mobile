import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs.dart';
import '../helpers/assets_provider.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, this.radius = 35}) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      radius: radius,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: SizedBox(
                height: radius * 2,
                width: radius * 2,
                child: SvgPicture.asset(state.currentUser != null &&
                        state.currentUser!.avatar != null
                    ? state.currentUser!.avatar!
                    : AssetsProvider.defaultAvatar)),
          );
        },
      ),
    );
  }
}
