import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helpers/constants.dart';
import '../../../../routes/router.dart';

import '../../../../blocs.dart';
import '../../../../helpers/assets_provider.dart';
import '../../../../widgets/widgets.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Mi perfil',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const _ProfileNameEmail(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: defaultPadding.copyWith(bottom: 0),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const _ProfileItems(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileItems extends StatelessWidget {
  const _ProfileItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconAndTextTileItem(
          onTap: () {
            context.router.push(const UserBasicInfoRoute());
          },
          label: 'Información básica',
          asset: AssetsProvider.userInfo,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {
            context.router.push(const UserPersonalInfoRoute());
          },
          label: 'Información personal',
          asset: AssetsProvider.userPersonal,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {},
          label: 'Cambiar avatar',
          asset: AssetsProvider.changeAvatar,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () => context.router.push(const UserLinkedAccountsRoute()),
          label: 'Cuentas vinculadas',
          asset: AssetsProvider.linkedUsersIcon,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {},
          label: 'Notificaciones',
          asset: AssetsProvider.notificationsIcon,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () => context.router.push(const UserSettingsRoute()),
          label: 'Configuración',
          asset: AssetsProvider.settingsIcon,
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        IconAndTextTileItem(
          onTap: () {},
          label: 'Preguntas frecuentes',
          asset: AssetsProvider.interrogationIcon,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {
            context.read<AuthBloc>().add(const AuthLogoutRequestedEvent());
            context.read<UserBloc>().add(const Logout());
          },
          label: 'Cerrar sesión',
          asset: AssetsProvider.logoutIcon,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _ProfileNameEmail extends StatelessWidget {
  const _ProfileNameEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        HapticFeedback.lightImpact();
        context.router.push(SetupRoute());
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Row(
          children: [
            const Avatar(),
            const SizedBox(width: 16),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () => Container(),
                    success: (user, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${user?.firstName} ${user?.lastName}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              '${user?.email}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color!
                                          .withOpacity(0.5)),
                            ),
                          ],
                        ));
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SvgPicture.asset(
                AssetsProvider.edit,
                height: 24,
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
