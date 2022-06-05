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
import 'package:user_repository/user_repository.dart';
import '../../../../../widgets/widgets.dart';
import '../../../form/view/user_form.dart';

class UserPersonalInfoPage extends StatefulWidget {
  const UserPersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<UserPersonalInfoPage> createState() => _UserPersonalInfoPageState();
}

class _UserPersonalInfoPageState extends State<UserPersonalInfoPage> {
  late final User? currentUser;
  @override
  void initState() {
    currentUser = context.read<UserBloc>().state.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FadeIn(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          padding: defaultPadding.copyWith(bottom: 0, top: 0),
          child: SingleChildScrollView(
            child: BlocListener<UserBloc, UserState>(
              listener: ((context, state) {
                if (state.status == UserStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
                      context,
                      'Error al modificar el perfil.',
                      SnackBarType.error));
                }
                if (state.status == UserStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    getSnackBar(context, 'Perfil guardado correctamente.',
                        SnackBarType.success),
                  );
                }
              }),
              child: BlocProvider(
                create: (context) => UserFormCubit(
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                    authenticationRepository:
                        RepositoryProvider.of<AuthenticationRepository>(
                            context))
                  ..init(false, currentUser),
                child: Builder(builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const PageTitle(
                        title: 'Mi perfil',
                      ),
                      const SizedBox(height: 35),
                      const _UserAvatar(),
                      const SizedBox(height: 16),
                      const _PersonalInfoAndEdit(),
                      const SizedBox(height: 16),
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state.status == UserStatus.loading) {
                            return Center(
                                child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Spinner(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ));
                          }

                          if (state.status == UserStatus.error) {
                            return Center(
                              child: SizedBox(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: const NoData(
                                  message:
                                      'Error al cargar la información del usuario.',
                                ),
                              ),
                            );
                          }
                          return const _UserForm();
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

class _UserForm extends StatelessWidget {
  const _UserForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        return Column(
          children: [
            const _SaveButton(),
            state.enabled ? const SizedBox(height: 16) : Container(),
            const UserForm(),
          ],
        );
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        return AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: state.enabled ? 55 : 0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          duration: const Duration(milliseconds: 100),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: BlocBuilder<UserFormCubit, UserFormState>(
              builder: (userBlocContext, userState) {
                return Button(
                    enabled: state.enabled,
                    onPressed: () => _saveUserData(context),
                    animate: userState.status.isSubmissionInProgress,
                    enabledColor: Theme.of(context).colorScheme.primary,
                    disbaledColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    labelColor: Theme.of(context).colorScheme.secondary,
                    label: 'Guardar cambios',
                    keyString: '');
              },
            ),
          ),
        );
      },
    );
  }
}

class _PersonalInfoAndEdit extends StatelessWidget {
  const _PersonalInfoAndEdit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                context.read<UserFormCubit>().enableForm(!state.enabled);
              },
              child: Row(
                children: [
                  Text('Editar', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(width: 8),
                  SvgPicture.asset(AssetsProvider.edit)
                ],
              ),
            );
          },
        ),
      ],
    );
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 14,
                  width: 14,
                  child: SvgPicture.asset(
                    AssetsProvider.refresh,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  )),
              const SizedBox(width: 10),
              Text(
                'Cambiar avatar',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _saveUserData(BuildContext context) async {
  if (context.read<UserFormCubit>().state.status.isSubmissionInProgress) {
    return;
  }
  HapticFeedback.lightImpact();

  await context.read<UserFormCubit>().saveUserData();

  context.read<UserFormCubit>().enableForm(false);

  if (context.read<UserFormCubit>().state.status.isSubmissionSuccess) {
    context.read<UserBloc>().add(UserGet());
  }
}
