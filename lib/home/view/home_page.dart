import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/user/repository/respository.dart';
import '../../routes/router.dart';

import '../../blocs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.user.isEmpty) {
          AutoRouter.of(context)
              .pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
        }
      },
      child: BlocProvider(
        create: (context) => UserBloc(
            RepositoryProvider.of<UserRepository>(context),
            RepositoryProvider.of<AuthenticationRepository>(context))
          ..add(UserLoading()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Scaffold(
              body: (state.status == UserStatus.loading)
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                'Nombre: ${state.currentUser?.firstName} ${state.currentUser?.lastName}'),
                            Text('Email: ${state.currentUser?.email}'),
                            Text('Creado: ${state.currentUser?.createdAt}'),
                            Text('Modificado: ${state.currentUser?.updatedAt}'),
                            Text('Sexo: ${state.currentUser?.sex?.name}'),
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context)
                                    .add(AuthLogoutRequestedEvent());
                              },
                              child: const Text('Logout'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<UserBloc>().add(UserDelete());
                              },
                              child: const Text('Delete'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(const UserUpdateRoute());
                              },
                              child: const Text('Update'),
                            ),
                          ]),
                    ),
            );
          },
        ),
      ),
    );
  }
}
