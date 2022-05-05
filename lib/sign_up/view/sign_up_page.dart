import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/helpers/assets_provider.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/sign_up/cubit/sign_up_cubit.dart';
import 'package:meddly/sign_up/view/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpCubit(RepositoryProvider.of<AuthenticationRepository>(context)),
      child: Scaffold(
        body: BlocListener<SignUpCubit, SignUpState>(
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
                child: SizedBox(
                  height: MediaQuery.of(context).size.height -
                      kBottomNavigationBarHeight,
                  child: Column(
                    children: [
                      const Spacer(flex: 1),
                      SvgPicture.asset(AssetsProvider.meddly_logo),
                      const Spacer(flex: 1),
                      const SignUpForm(),
                      const Spacer(flex: 3),
                      const _AlreadyHaveAnAccountText(),
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
