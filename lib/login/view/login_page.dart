import 'package:animate_do/animate_do.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/helpers/assets_provider.dart';
import '../../widgets/widgets.dart';
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
          state.when(
            unauthenticated: () {},
            authenticated: (AuthUser user) => AutoRouter.of(context)
                .pushAndPopUntil(const LoadingRoute(),
                    predicate: ((route) => false)),
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            leading: const MeddlyBackButton(),
          ),
          body: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: const _LoginPageBody()),
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
          padding: defaultPadding.copyWith(top: 0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.vertical -
                        Scaffold.of(context).appBarMaxHeight! -
                        defaultPadding.bottom -
                        defaultPadding.top),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -300,
                      right: -300,
                      child: FadeInRight(
                        duration: const Duration(milliseconds: 300),
                        child: SvgPicture.asset(
                          AssetsProvider.meddlyLogo,
                          height: 600,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(flex: 3),
                        FadeInLeft(
                          duration: const Duration(milliseconds: 300),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                                TextSpan(children: [
                                  const TextSpan(text: 'Inicia sesión para\n'),
                                  TextSpan(
                                      text: 'comenzar.',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer)),
                                ]),
                                style: Theme.of(context).textTheme.titleLarge!),
                          ),
                        ),

                        // const Spacer(flex: 2),
                        const SizedBox(height: 16),
                        FadeInLeft(
                            duration: const Duration(milliseconds: 300),
                            child: const LoginForm()),
                        const Spacer(flex: 2),
                        const _DontHaveAnAccountText(),
                      ],
                    )
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
      onTap: () {
        HapticFeedback.lightImpact();
        AutoRouter.of(context).popAndPush(const SignUpRoute());
      },
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '¿No tienes cuenta? ',
            style: Theme.of(context).textTheme.bodyMedium),
        TextSpan(
            text: 'Regístrate',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold)),
      ])),
    );
  }
}
