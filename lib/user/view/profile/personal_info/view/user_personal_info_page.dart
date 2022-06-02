import 'package:animate_do/animate_do.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:meddly/blocs.dart';
import 'package:meddly/helpers/assets_provider.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/user/repository/respository.dart';
import '../../../../../widgets/widgets.dart';
import '../../../form/view/user_form.dart';

class UserPersonalInfoPage extends StatelessWidget {
  const UserPersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FadeIn(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          padding: defaultPadding.copyWith(bottom: 0, top: 0),
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => UserFormCubit(
                  authenticationRepository:
                      RepositoryProvider.of<AuthenticationRepository>(context),
                  userRepository:
                      RepositoryProvider.of<UserRepository>(context))
                ..init(false),
              child: BlocListener<UserFormCubit, UserFormState>(
                listener: (context, state) {
                  if (state.status.isSubmissionFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
                        context,
                        'Error al modificar el perfil.',
                        SnackBarType.error));
                  }
                },
                child: Builder(builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const PageTitle(
                        title: 'Mi Perfil',
                      ),
                      const SizedBox(height: 35),
                      const _UserAvatar(),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text('Información personal',
                              style: Theme.of(context).textTheme.titleSmall),
                          const Spacer(),
                          BlocBuilder<UserFormCubit, UserFormState>(
                            builder: (context, state) {
                              return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  HapticFeedback.heavyImpact();
                                  context
                                      .read<UserFormCubit>()
                                      .enableForm(!state.enabled);
                                },
                                child: Row(
                                  children: [
                                    Text('Editar',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    const SizedBox(width: 8),
                                    SvgPicture.asset(AssetsProvider.edit)
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<UserFormCubit, UserFormState>(
                        builder: (context, state) {
                          if (state.userStatus == UserStatus.success) {
                            return Column(
                              children: [
                                AnimatedContainer(
                                  width: MediaQuery.of(context).size.width,
                                  height: state.enabled ? 55 : 0,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  duration: const Duration(milliseconds: 100),
                                  child: SingleChildScrollView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    child: Button(
                                        enabled: state.enabled,
                                        onPressed: () async {
                                          if (context
                                              .read<UserFormCubit>()
                                              .state
                                              .status
                                              .isSubmissionInProgress) return;
                                          await context
                                              .read<UserFormCubit>()
                                              .saveUserData();

                                          context
                                              .read<UserFormCubit>()
                                              .enableForm(false);

                                          if (context
                                              .read<UserFormCubit>()
                                              .state
                                              .status
                                              .isSubmissionSuccess) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(getSnackBar(
                                                    context,
                                                    'Perfil modificado con éxito.',
                                                    SnackBarType.success));
                                          }
                                        },
                                        animate:
                                            state.status.isSubmissionInProgress,
                                        enabledColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        disbaledColor: Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer,
                                        labelColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        label: 'Guardar cambios',
                                        keyString: ''),
                                  ),
                                ),
                                state.enabled
                                    ? const SizedBox(height: 16)
                                    : Container(),
                                const UserForm(),
                              ],
                            );
                          } else if (state.userStatus == UserStatus.loading) {
                            return Center(
                                child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Spinner(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ));
                          } else {
                            return Center(
                              child: SizedBox(
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                child: const NoData(
                                    message: 'No se puede cargar el perfil.'),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Avatar(radius: 50),
          const SizedBox(height: 16),
          Text(
            'Cambiar avatar',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
