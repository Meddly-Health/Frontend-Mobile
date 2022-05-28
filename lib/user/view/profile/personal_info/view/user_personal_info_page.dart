import 'package:flutter/material.dart';
import 'package:meddly/helpers/constants.dart';
import '../../../../../widgets/widgets.dart';

class UserPersonalInfoPage extends StatelessWidget {
  const UserPersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageTitle(title: 'Mi Perfil'),
          const SizedBox(height: 35),
          const _UserAvatar(),
          const SizedBox(height: 16),
          Text('Información personal',
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 16),
          Text(
            'Nombre(s) y apellido(s)',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Text(
            'Fecha de nacimiento',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Text(
            'Peso',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Text(
            'Altura',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Text(
            'Sexo',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ));
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xff95D6A4),
            radius: 50,
          ),
          const SizedBox(height: 16),
          Text(
            'Cambiar avatar',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
