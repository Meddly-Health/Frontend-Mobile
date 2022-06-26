// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:meddly/routes/router.dart';

import '../../helpers/assets_provider.dart';
import '../../helpers/constants.dart';
import '../../widgets/widgets.dart';

class UserLinkedAccountsPage extends StatelessWidget {
  const UserLinkedAccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        child: SingleChildScrollView(
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
                Center(
                  child: SvgPicture.asset(
                    AssetsProvider.supervisorsVector,
                    width: MediaQuery.of(context).size.height / 3,
                  ),
                ),
                const SizedBox(height: 30),
                const _Buttons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        children: [
          const _Button(
            title: 'Supervisores',
            description:
                'Los supervisores pueden acceder a tus datos para ayudarte con tu seguimiento.',
            route: SupervisorsRoute(),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          const _Button(
              title: 'Supervisados',
              description:
                  'Los supervisados son pacientes a los cuales tú puedes acceder a su seguimiento.',
              route: SupervisedRoute()),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (context) => Container());
            },
            child: const _Button(
              title: 'Ingresar código',
              description:
                  'Ingrese el código de supervisor que recibió por correo electrónico o mensaje de texto.',
            ),
          )
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.title,
    required this.description,
    this.route,
  }) : super(key: key);

  final String title;
  final String description;
  final PageRouteInfo? route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        HapticFeedback.lightImpact();
        if (route != null) {
          context.router.push(route!);
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                AutoSizeText(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.5)),
                  // textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(AssetsProvider.chevron, height: 20)
        ],
      ),
    );
  }
}
