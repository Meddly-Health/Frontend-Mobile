import 'package:animate_do/animate_do.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../../../../blocs.dart';

import '../../../../../../helpers/constants.dart';
import '../../../../../../login/view/login_form.dart';

import '../../../../../../widgets/widgets.dart';

class DeleteUserPage extends StatelessWidget {
  const DeleteUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        child: Container(
          padding: defaultPadding,
          child: Column(
            children: [
              const PageTitle(title: 'Eliminar cuenta'),
              const SizedBox(height: 35),
              Text('¿Estás seguro de que quieres eliminar tu cuenta?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text(
                'Esta acción no se puede deshacer.\nSe borrarán permanentemente todos sus datos. Luego de eliminar la cuenta, no hay vuelta atrás.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.5),
                    ),
              ),
              const SizedBox(height: 16),
              Button(
                  enabled: true,
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => BlocProvider(
                        create: (context) => LoginCubit(
                            RepositoryProvider.of<AuthenticationRepository>(
                                context)),
                        child: BlocListener<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state.status.isSubmissionSuccess) {
                              _deleteAccount(context);
                            } else if (state.status.isSubmissionFailure) {
                              context.router.pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  getSnackBar(context, state.errorMessage!,
                                      SnackBarType.error));
                            }
                          },
                          child: BlocListener<UserBloc, UserState>(
                            listener: (context, state) {
                              state.whenOrNull(error: (errorMessage) {
                                context.router.pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    getSnackBar(context, errorMessage,
                                        SnackBarType.error));
                              });
                            },
                            child: AlertDialog(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                title: Text(
                                  'Para confirmar, ingrese a su cuenta nuevamente.',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                actions: [
                                  BlocBuilder<LoginCubit, LoginState>(
                                    builder: (context, state) {
                                      return GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () {
                                            HapticFeedback.lightImpact();
                                            if (!state.status
                                                .isSubmissionInProgress) {
                                              context.router.pop();
                                            }
                                          },
                                          child: const Text('Cancelar'));
                                    },
                                  )
                                ],
                                actionsPadding: defaultPadding,
                                content: const SingleChildScrollView(
                                    child: LoginForm())),
                          ),
                        ),
                      ),
                    );
                  },
                  animate: false,
                  enabledColor: Theme.of(context).colorScheme.error,
                  disbaledColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  labelColor: Theme.of(context).colorScheme.secondary,
                  label: 'Continuar',
                  keyString: 'delete_user_button'),
            ],
          ),
        ),
      ),
    );
  }
}

void _deleteAccount(BuildContext context) {
  bool isConnected = context.read<ConnectivityBloc>().state.isConnected;
  if (!isConnected) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        getSnackBar(context, 'No hay conexión a internet', SnackBarType.error));
    return;
  }
  context.read<UserBloc>().add(const DeleteUser());
}
