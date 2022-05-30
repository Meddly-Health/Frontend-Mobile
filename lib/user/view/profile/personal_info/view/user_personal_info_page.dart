import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/blocs.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/user/repository/respository.dart';
import 'package:meddly/user/view/form/view/user_form.dart';
import '../../../../../widgets/widgets.dart';

class UserPersonalInfoPage extends StatelessWidget {
  const UserPersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: defaultPadding.copyWith(bottom: 0),
      child: SingleChildScrollView(
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
            BlocProvider(
              create: (context) => UserFormCubit(
                  authenticationRepository:
                      RepositoryProvider.of<AuthenticationRepository>(context),
                  userRepository:
                      RepositoryProvider.of<UserRepository>(context)),
              child: const UserUpdateForm(),
            )
          ],
        ),
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
