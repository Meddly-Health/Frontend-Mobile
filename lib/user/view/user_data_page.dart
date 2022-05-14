import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/user/cubit/user_form_cubit.dart';
import 'package:meddly/user/repository/respository.dart';
import 'package:meddly/user/view/user_data_form.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserFormCubit(RepositoryProvider.of<UserRepository>(context)),
      child: BlocListener<UserFormCubit, UserFormState>(
        listener: (context, state) {
          if (state.status.isSubmissionSuccess) {
            AutoRouter.of(context).pushAndPopUntil(const HomeRoute(),
                predicate: ((route) => false));
          } else if (state.status.isSubmissionFailure) {
            print('error');
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: const _UserDataPageBody(),
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
    return Builder(builder: (context) {
      return Container(
        padding: defaultPadding,
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height -
                      Scaffold.of(context).appBarMaxHeight! -
                      MediaQuery.of(context).padding.vertical -
                      defaultPadding.vertical),
              child: FadeIn(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Por favor, completa tus datos personales',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      const UserDataForm(),
                      const Spacer(),
                      const _OmitOrSave()
                    ]),
              ),
            ),
          ),
        ),
      );
    });
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
            AutoRouter.of(context).pushAndPopUntil(const HomeRoute(),
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
                  Text('Omitir', style: Theme.of(context).textTheme.bodyLarge),
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
