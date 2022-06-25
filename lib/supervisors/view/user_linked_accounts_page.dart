import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
        children: const [
          _SupervisorsButton(),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 8),
          _SupervisedButton(),
        ],
      ),
    );
  }
}

class _SupervisedButton extends StatelessWidget {
  const _SupervisedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        context.router.push(const SupervisedRoute());
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Supervisados',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                AutoSizeText(
                  'Los supervisados son usuarios a los cuales tú puedes acceder a su seguimiento.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.5)),
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

class _SupervisorsButton extends StatelessWidget {
  const _SupervisorsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        context.router.push(const SupervisorsRoute());
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Supervisores',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                AutoSizeText(
                  'Los supervisores pueden acceder a tus datos para ayudarte con tus seguimiento.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.5)),
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
