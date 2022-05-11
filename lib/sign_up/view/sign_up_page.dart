import 'package:animate_do/animate_do.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import '../../helpers/assets_provider.dart';
import '../../helpers/constants.dart';
import '../../routes/router.dart';
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
          if (state.user.isNotEmpty) {
            AutoRouter.of(context).pushAndPopUntil(const UserDataRoute(),
                predicate: ((route) => false));
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: const _SignUpPageBody(),
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
      return BlocListener<SignUpCubit, SignUpState>(
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
          if (state.status.isSubmissionSuccess) {
            ///
          }
        },
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(flex: 1),
                    Hero(
                        tag: 'logo',
                        child: SvgPicture.asset(AssetsProvider.meddlyLogo)),
                    const Spacer(flex: 1),
                    FadeIn(child: const SignUpForm()),
                    const Spacer(flex: 3),
                    const _AlreadyHaveAnAccountText(),
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

class _AlreadyHaveAnAccountText extends StatelessWidget {
  const _AlreadyHaveAnAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('signUpTextButton'),
      onTap: () => AutoRouter.of(context)
          .pushAndPopUntil(const LoginRoute(), predicate: (route) => false),
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
