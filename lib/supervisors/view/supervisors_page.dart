import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/supervisors/view/widgets/dismiss_tile.dart';
import 'package:meddly/widgets/widgets.dart';

import '../../../../../../blocs.dart';
import '../../../../../../helpers/assets_provider.dart';
import '../../helpers/helpers.dart';

class SupervisorsPage extends StatelessWidget {
  const SupervisorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupervisorsBloc, SupervisorsState>(
      listener: (context, state) {
        if (state.status == SupervisorsStatus.deleted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(context, 'Supervisor eliminado con éxito.',
                SnackBarType.success),
          );
        }
        if (state.status == SupervisorsStatus.added) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(
                context, 'Supervisor añadido con éxito.', SnackBarType.success),
          );
        }
        if (state.status == SupervisorsStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, state.errorMessage!, SnackBarType.error));
        }
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: FadeIn(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    padding: defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageTitle(
                          title: 'Supervisores',
                          onPop: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Comparta su seguimiento y progreso con amigos o familiares, copiando el siguiente código. Válido para un único paciente.',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!
                                        .withOpacity(0.5),
                                  ),
                          textAlign: TextAlign.justify,
                        ),
                        const _CodeFormFieldSupervisors(),
                        Text(
                          'Supervisores activos',
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                  const _Supervisors(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Supervisors extends StatelessWidget {
  const _Supervisors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupervisorsBloc, SupervisorsState>(
      builder: (context, state) {
        if (state.status == SupervisorsStatus.loading) {
          return const Expanded(
            child: Center(child: Loading()),
          );
        }

        if (state.supervisors == null || state.supervisors!.isEmpty) {
          return const Expanded(
            child: NoData(
              message: 'No añadiste ningún supervisor',
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.supervisors!.length,
          itemBuilder: (context, index) => DismissTile(
              user: state.supervisors![index],
              onDismissed: () {
                context
                    .read<SupervisorsBloc>()
                    .add(DeleteSupervisor(state.supervisors![index].id!));
              }),
        );
      },
    );
  }
}

class _CodeFormFieldSupervisors extends StatefulWidget {
  const _CodeFormFieldSupervisors({
    Key? key,
  }) : super(key: key);

  @override
  State<_CodeFormFieldSupervisors> createState() =>
      _CodeFormFieldSupervisorsState();
}

class _CodeFormFieldSupervisorsState extends State<_CodeFormFieldSupervisors> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      if (_controller.text.length == 12) {
        FocusManager.instance.primaryFocus?.unfocus();
        BlocProvider.of<SupervisorsBloc>(context)
            .add(AddSupervised(_controller.text));
        BlocProvider.of<UserBloc>(context).add(UserGet());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupervisorsBloc, SupervisorsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
          child: TextFormField(
            controller: _controller,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.characters,
            inputFormatters: [
              LengthLimitingTextInputFormatter(12),
              maskFormatter
            ],
            onChanged: (value) {},
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'A1A-A1A1-A1A',
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
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .color!
                        .withOpacity(0.5),
                  ),
              suffix: GestureDetector(
                onTap: () async {
                  var clipboardData = await Clipboard.getData('text/plain');
                  if (clipboardData != null &&
                      clipboardData.text != null &&
                      clipboardData.text?.length == 12) {
                    setState(() {
                      _controller.text = clipboardData.text!;
                    });
                  }
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
