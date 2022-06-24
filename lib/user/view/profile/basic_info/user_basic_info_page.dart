import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/helpers/helpers.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

import '../../../../blocs.dart';

class UserBasicInfoPage extends StatelessWidget {
  const UserBasicInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: defaultPadding,
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const NoData(message: 'Error 404'),
                  success: (user, _) => _OnSuccess(user: user!));
            },
          ),
        ),
      ),
    );
  }
}

class _OnSuccess extends StatelessWidget {
  const _OnSuccess({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageTitle(title: 'Información básica'),
        const SizedBox(height: 35),
        Text('Nombre: ${user.firstName!} ${user.lastName}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        Text(
            'Fecha de Nacimiento: ${user.birth!.day} de ${getMonthName(user.birth!.month)} de ${user.birth!.year}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        Text('Género: ${user.sex!.name.capitalize()}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
