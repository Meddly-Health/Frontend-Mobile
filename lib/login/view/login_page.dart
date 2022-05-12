import 'package:animate_do/animate_do.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/widgets/widgets.dart';
import '../../helpers/assets_provider.dart';
import '../../helpers/constants.dart';
import '../../routes/router.dart';

import '../../blocs.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(RepositoryProvider.of<AuthenticationRepository>(context)),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.user.isNotEmpty) {
            AutoRouter.of(context).pushAndPopUntil(const HomeRoute(),
                predicate: ((route) => false));
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: const _LoginPageBody(),
        ),
      ),
    );
  }
}

class _LoginPageBody extends StatelessWidget {
  const _LoginPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(listener: (context, state) {
            {
              if (state.status.isSubmissionFailure) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  getSnackBar(
                      context,
                      state.errorMessage ??
                          'Por favor, revise los datos ingresados.',
                      SnackBarType.error),
                );
              }
              if (state.status.isSubmissionInProgress) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }

              if (state.status.isSubmissionSuccess) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }
            }
          }),
          BlocListener<ConnectivityBloc, ConnectivityState>(
            listener: ((context, state) {
              if (!state.isConnected) {
                ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
                    context,
                    'No hay conexión a Internet.',
                    SnackBarType.error,
                    const Duration(days: 365)));
              } else {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }
            }),
          )
        ],
        child: Container(
          padding: defaultPadding,
          child: SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.vertical -
                        Scaffold.of(context).appBarMaxHeight! -
                        defaultPadding.bottom -
                        defaultPadding.top),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(flex: 1),
                    SvgPicture.asset(AssetsProvider.meddlyLogo),
                    const Spacer(flex: 1),
                    FadeIn(child: const LoginForm()),
                    const Spacer(flex: 3),
                    const _DontHaveAnAccountText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
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
      onTap: () => AutoRouter.of(context)
          .pushAndPopUntil(const SignUpRoute(), predicate: (route) => false),
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
