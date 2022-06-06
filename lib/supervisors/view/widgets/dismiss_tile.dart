import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_repository/user_repository.dart';

import '../../../helpers/assets_provider.dart';

class DismissTile extends StatelessWidget {
  const DismissTile({Key? key, required this.user, required this.onDismiss})
      : super(key: key);

  final User user;
  final Function onDismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  AssetsProvider.trashIcon,
                  color: Theme.of(context).colorScheme.secondary,
                )),
          ),
        ),
      ),
      key: Key(user.id.toString()),
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: SvgPicture.asset(
              AssetsProvider.defaultAvatar,
            ),
          ),
          title: Text(user.firstName!,
              style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text(
            user.email!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .color!
                      .withOpacity(0.5),
                ),
          ),
        ),
      ),
    );
  }
}
