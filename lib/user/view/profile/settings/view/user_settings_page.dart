import 'package:flutter/material.dart';

import '../../../../../helpers/assets_provider.dart';
import '../../../../../helpers/constants.dart';
import '../../../../../widgets/widgets.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(
              title: 'Configuración',
            ),
            const SizedBox(height: 35),
            Column(
              children: [
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Cambiar contraseña',
                  asset: AssetsProvider.lockIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Exportar datos',
                  asset: AssetsProvider.pdfIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Idioma',
                  asset: AssetsProvider.settingsIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Reportar errores en la aplicación',
                  asset: AssetsProvider.megaphoneIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Compartir con mis amigos',
                  asset: AssetsProvider.shareIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Políticas de privacidad',
                  asset: AssetsProvider.reciveIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Ajustes del calendario',
                  asset: AssetsProvider.calendarIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Unidades de medida',
                  asset: AssetsProvider.rulerIcon,
                ),
                const SizedBox(height: 35),
                IconAndTextTileItem(
                  onTap: () {},
                  label: 'Eliminar cuenta',
                  asset: AssetsProvider.deleteUser,
                  color: Theme.of(context).colorScheme.error,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
