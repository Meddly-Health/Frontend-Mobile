import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context)
                  .add(AuthLogoutRequestedEvent());
            },
            child: const Text('Logout'),
          ),
        ),
      ),
    );
  }
}
