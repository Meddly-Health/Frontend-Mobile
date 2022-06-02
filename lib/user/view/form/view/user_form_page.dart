import 'package:animate_do/animate_do.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/user/repository/respository.dart';
import 'package:meddly/user/view/form/view/user_form.dart';
import 'package:meddly/widgets/widgets.dart';

import '../../../../blocs.dart';

class UserUpdatePage extends StatelessWidget {
  const UserUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserFormCubit(
          userRepository: RepositoryProvider.of<UserRepository>(context),
          authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context))
        ..init(),
      child: BlocListener<UserFormCubit, UserFormState>(
        listener: (context, state) {
          if (state.userStatus == UserStatus.loading) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Center(child: CircularProgressIndicator());
              },
            );
          }

          if (state.status.isSubmissionSuccess) {
            AutoRouter.of(context).pushAndPopUntil(const HomeRouter(),
                predicate: ((route) => false));
          } else if (state.status.isSubmissionFailure ||
              state.userStatus == UserStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, state.errorMessage!, SnackBarType.error),
            );
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(),
          body: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: const _UserDataPageBody()),
        ),
      ),
    );
  }
}

class _UserDataPageBody extends StatelessWidget {
  const _UserDataPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        if (state.userStatus == UserStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Builder(builder: (context) {
          return Container(
            padding: defaultPadding,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: FadeIn(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Por favor, completa tus datos personales',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      const UserForm(),
                      const SizedBox(height: 16),
                      const _OmitOrSave(),
                      const SizedBox(height: 16)
                    ]),
              ),
            ),
          );
        });
      },
    );
  }
}

class _OmitOrSave extends StatelessWidget {
  const _OmitOrSave({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            AutoRouter.of(context).pushAndPopUntil(const HomeRouter(),
                predicate: ((route) => false));
          },
          child: Container(
            width: 150,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child:
                  Text('Omitir', style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ),
        const Spacer(),
        BlocBuilder<UserFormCubit, UserFormState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () async {
                if (state.isValid) {
                  context.read<UserFormCubit>().saveUserData();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  color: state.isValid
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Guardar',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          )),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
