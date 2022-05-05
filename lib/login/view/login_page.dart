import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/helpers/assets_provider.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/login/cubit/login_cubit.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(RepositoryProvider.of<AuthenticationRepository>(context)),
      child: Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status.isSubmissionFailure) {
              AutoRouter.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Error'),
                  backgroundColor: Colors.red,
                ),
              );
            }
            if (state.status.isSubmissionInProgress) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()));
            }
          },
          child: Container(
            padding: defaultPadding,
            child: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height -
                      kBottomNavigationBarHeight,
                  child: Column(
                    children: [
                      const Spacer(flex: 1),
                      SvgPicture.asset(AssetsProvider.meddly_logo),
                      const Spacer(flex: 1),
                      const LoginForm(),
                      const Spacer(flex: 3),
                      const _DontHaveAnAccountText(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DontHaveAnAccountText extends StatelessWidget {
  const _DontHaveAnAccountText({
    Key? key,
  }) : super(key: key);

  @visibleForTesting
  static const testingKey = Key('go_to_signup');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: testingKey,
      //onTap: () => AutoRouter.of(context).pushAndPopUntil(, predicate: (route) => route.isFirst && route.isCurrent),
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '¿No tienes cuenta? ',
            style: Theme.of(context).textTheme.bodyMedium),
        TextSpan(
            text: 'Registrate',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold)),
      ])),
    );
  }
}
