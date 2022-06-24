import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../helpers/assets_provider.dart';
import '../../../../../helpers/constants.dart';
import '../../../../../routes/router.dart';
import '../../../../../widgets/widgets.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: defaultPadding,
                child: PageTitle(
                  title: 'Configuración',
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: defaultPadding.copyWith(bottom: 0),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const _SettingsItems(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsItems extends StatelessWidget {
  const _SettingsItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconAndTextTileItem(
          onTap: () {},
          label: 'Cambiar contraseña',
          asset: AssetsProvider.lockIcon,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {},
          label: 'Exportar datos',
          asset: AssetsProvider.pdfIcon,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {},
          label: 'Idioma',
          asset: AssetsProvider.settingsIcon,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {},
          label: 'Reportar errores en la aplicación',
          asset: AssetsProvider.megaphoneIcon,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {},
          label: 'Compartir con mis amigos',
          asset: AssetsProvider.shareIcon,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {},
          label: 'Políticas de privacidad',
          asset: AssetsProvider.receiptIcon,
        ),
        const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () {},
          label: 'Ajustes del calendario',
          asset: AssetsProvider.calendarIconSolid,
        ),
        const SizedBox(height: 16),
        // IconAndTextTileItem(
        //   onTap: () {},
        //   label: 'Unidades de medida',
        //   asset: AssetsProvider.rulerIcon,
        // ),
        // const SizedBox(height: 16),
        IconAndTextTileItem(
          onTap: () => context.router.push(const DeleteUserRoute()),
          label: 'Eliminar cuenta',
          asset: AssetsProvider.deleteUser,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
