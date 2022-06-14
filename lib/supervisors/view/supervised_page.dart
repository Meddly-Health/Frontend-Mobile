import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/supervisors/view/widgets/dismiss_tile_loading.dart';

import '../../helpers/constants.dart';

import '../../../../../../blocs.dart';
import '../../../../../../helpers/assets_provider.dart';
import '../../../../../../widgets/widgets.dart';
import 'widgets/dismiss_tile.dart';

class SupervisedPage extends StatelessWidget {
  const SupervisedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupervisorsBloc, SupervisorsState>(
      listener: (context, state) {
        if (state.status == SupervisorsStatus.deleted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(context, 'Supervisado eliminado con éxito.',
                SnackBarType.success),
          );
        }
        if (state.status == SupervisorsStatus.added) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(context, 'Supervisado añadido con éxito.',
                SnackBarType.success),
          );
        }
        if (state.status == SupervisorsStatus.error) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, state.errorMessage!, SnackBarType.error));
        }
      },
      child: Scaffold(
        body: FadeIn(
          child: Column(
            children: [
              Container(
                padding: defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PageTitle(
                      title: 'Supervisados',
                      onPop: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Comparta su seguimiento y progreso con amigos o familiares, copiando el siguiente código. Válido para un único paciente.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .color!
                                .withOpacity(0.5),
                          ),
                      textAlign: TextAlign.justify,
                    ),
                    const _CodeFormFieldSupervised(),
                    Text(
                      'Supervisados activos',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              const _Supervised(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CodeFormFieldSupervised extends StatefulWidget {
  const _CodeFormFieldSupervised({
    Key? key,
  }) : super(key: key);

  @override
  State<_CodeFormFieldSupervised> createState() =>
      _CodeFormFieldSupervisedState();
}

class _CodeFormFieldSupervisedState extends State<_CodeFormFieldSupervised> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = context.read<UserBloc>().state.currentUser!.invitation!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
          child: TextFormField(
            readOnly: true,
            controller: _controller,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
            textInputAction: TextInputAction.done,
            onChanged: (value) {},
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              fillColor: Theme.of(context).colorScheme.secondary,
              border: InputBorder.none,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .color!
                        .withOpacity(0.5),
                  ),
              suffix: GestureDetector(
                onTap: () async {
                  await Clipboard.setData(
                      ClipboardData(text: _controller.text));
                  ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
                      context,
                      'Código copiado al portapapeles',
                      SnackBarType.success));
                },
                child: SvgPicture.asset(
                  AssetsProvider.copy,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 18,
                maxWidth: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Supervised extends StatelessWidget {
  const _Supervised({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupervisorsBloc, SupervisorsState>(
        builder: (context, state) {
      if (state.status == SupervisorsStatus.loading) {
        return const DismissTileLoading();
      }

      if (state.supervised == null || state.supervised!.isEmpty) {
        return const NoData(message: 'No añadiste ningún supervisado');
      }

      return ListView.builder(
          shrinkWrap: true,
          itemCount: state.supervised?.length,
          itemBuilder: (context, index) => DismissTile(
              user: state.supervised![index],
              onDismissed: () {
                context.read<SupervisorsBloc>().add(
                      DeleteSupervised(state.supervised![index].id!),
                    );
              }));
    });
  }
}
