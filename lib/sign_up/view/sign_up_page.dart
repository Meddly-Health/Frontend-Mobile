import 'package:animate_do/animate_do.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/helpers/constants.dart';
import '../../helpers/assets_provider.dart';
import '../../routes/router.dart';
import '../../widgets/widgets.dart';
import 'sign_up_form.dart';

import '../../blocs.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpCubit(RepositoryProvider.of<AuthenticationRepository>(context)),
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
              child: const _SignUpPageBody()),
        ),
      ),
    );
  }
}

class _SignUpPageBody extends StatelessWidget {
  const _SignUpPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiBlocListener(
        listeners: [
          BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                context.read<SignUpCubit>().termsAcceptedChanged(false);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  getSnackBar(
                    context,
                    state.errorMessage ??
                        'Por favor, revise los datos ingresados.',
                    SnackBarType.error,
                  ),
                );
              }
              if (state.status.isSubmissionInProgress) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }

              if (state.status.isSubmissionSuccess) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }
            },
          ),
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
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -200,
                right: -300,
                child: FadeInRight(
                  duration: const Duration(milliseconds: 300),
                  child: SvgPicture.asset(
                    AssetsProvider.meddlyLogo,
                    height: 600,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: defaultPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeInLeft(
                        duration: const Duration(milliseconds: 300),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                              TextSpan(children: [
                                const TextSpan(text: 'Bienvenido!\n'),
                                TextSpan(
                                    text: 'Crea tu cuenta para comenzar.',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                              ]),
                              style: Theme.of(context).textTheme.titleLarge!),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FadeInLeft(
                          duration: const Duration(milliseconds: 300),
                          child: const SignUpForm()),
                      const SizedBox(height: 35),
                      const _AlreadyHaveAnAccountText(),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _AlreadyHaveAnAccountText extends StatelessWidget {
  const _AlreadyHaveAnAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('signUpTextButton'),
      onTap: () {
        HapticFeedback.lightImpact();
        AutoRouter.of(context).popAndPush(const LoginRoute());
      },
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: '¿Ya tienes cuenta? ',
            style: Theme.of(context).textTheme.bodyMedium),
        TextSpan(
            text: 'Inicia Sesión',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold)),
      ])),
    );
  }
}
