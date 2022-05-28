import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/auth/bloc/auth_bloc.dart';
import 'package:meddly/routes/router.dart';

import '../../../helpers/assets_provider.dart';
import '../../../helpers/constants.dart';
import '../../../widgets/widgets.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mi Perfil',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            const _ProfileNameEmail(),
            const SizedBox(height: 35),
            Column(
              children: [
                IconAndTextTileItem(
                  onTap: () =>
                      context.router.push(const UserLinkedAccountsRoute()),
                  label: 'Cuentas vinculadas',
                  asset: AssetsProvider.linkedUsersIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Notificaciones',
                  asset: AssetsProvider.notificationsIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () => context.router.push(const UserSettingsRoute()),
                  label: 'Configuración',
                  asset: AssetsProvider.settingsIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Preguntas frecuentes',
                  asset: AssetsProvider.interrogationIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () =>
                      context.read<AuthBloc>().add(AuthLogoutRequestedEvent()),
                  label: 'Cerrar sesión',
                  asset: AssetsProvider.logoutIcon,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileNameEmail extends StatelessWidget {
  const _ProfileNameEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: GestureDetector(
        onTap: () => context.router.push(const UserPersonalInfoRoute()),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xff95D6A4),
              radius: 35,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lorenzo Sala',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'salaloren@gmail.com',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .color!
                          .withOpacity(0.5)),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(AssetsProvider.chevron))
          ],
        ),
      ),
    );
  }
}
