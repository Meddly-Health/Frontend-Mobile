import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meddly/helpers/assets_provider.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/widgets/widgets.dart';

class UserLinkedAccountsPage extends StatelessWidget {
  const UserLinkedAccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        child: Container(
          padding: defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(
                title: 'Cuentas vinculadas',
                onPop: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
              const SizedBox(height: 30),
              Text(
                'Los supervisores pueden acceder a tus datos para ayudarte con tus seguimiento.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .color!
                        .withOpacity(0.5)),
              ),
              const SizedBox(height: 16),
              IconAndTextTileItem(
                  label: 'Supervisores',
                  asset: AssetsProvider.linkedUsersIcon,
                  onTap: () =>
                      context.router.push(const UserSupervisorsRoute())),
              const SizedBox(height: 30),
              Text(
                'Los supervisados son usuarios a los cuales tú puedes acceder a su seguimiento.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .color!
                        .withOpacity(0.5)),
              ),
              const SizedBox(height: 16),
              IconAndTextTileItem(
                  label: 'Supervisados',
                  asset: AssetsProvider.linkedUsersIcon,
                  onTap: () =>
                      context.router.push(const UserSupervisedRoute())),
            ],
          ),
        ),
      ),
    );
  }
}
