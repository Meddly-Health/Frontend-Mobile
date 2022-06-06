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

class SupervisorsPage extends StatelessWidget {
  const SupervisorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupervisorsBloc, SupervisorsState>(
      listener: (context, state) {
        if (state.status == SupervisorsStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, state.errorMessage!, SnackBarType.error));
        }
      },
      child: Scaffold(
        body: FadeIn(
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .withOpacity(0.5),
                            ),
                        textAlign: TextAlign.justify,
                      ),
                      // const SizedBox(height: 16),
                      // const _CodeIconText(),
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
    );
  }
}

class _CodeIconText extends StatelessWidget {
  const _CodeIconText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(999),
          ),
          child: SvgPicture.asset(
            AssetsProvider.linkIcon,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'Tu código de invitación',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
        ),
      ],
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
          return Expanded(
            child: Center(
                child: Spinner(color: Theme.of(context).colorScheme.primary)),
          );
        }
        if (state.status == SupervisorsStatus.success) {
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
            itemBuilder: (context, index) =>
                DismissTile(user: state.supervisors![index], onDismiss: () {}),
          );
        } else {
          return const Expanded(
            child: NoData(
              message: 'No añadiste ningún supervisor',
            ),
          );
        }
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
