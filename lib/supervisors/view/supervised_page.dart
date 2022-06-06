// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:meddly/helpers/constants.dart';

import '../../../../../../blocs.dart';
import '../../../../../../helpers/assets_provider.dart';
import '../../../../../../widgets/widgets.dart';
import '../../helpers/helpers.dart';
import 'widgets/dismiss_tile.dart';

class SupervisedPage extends StatelessWidget {
  const SupervisedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupervisorsBloc, SupervisorsState>(
      listener: (context, state) {
        if (state.status == SupervisorsStatus.error) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context,
              'Error. Verifique el código ingresado.', SnackBarType.error));
        }
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: FadeIn(
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
                        'Ingrese aquí el código de verificación que recibió por correo electrónico o mensaje de texto. Al continuar, usted acepta nuestros términos y ha leído nuestra política de privacidad.',
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
          'Ingresar código de invitación',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
        ),
      ],
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
        return Expanded(
          child: Center(
              child: Spinner(color: Theme.of(context).colorScheme.primary)),
        );
      }
      if (state.status == SupervisorsStatus.success) {
        if (state.supervised == null || state.supervised!.isEmpty) {
          return const Expanded(
            child: NoData(message: 'No añadiste ningún supervisado'),
          );
        }

        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.supervised?.length,
            itemBuilder: (context, index) =>
                DismissTile(user: state.supervised![index], onDismiss: () {}));
      } else {
        return const Expanded(
          child: NoData(
            message: 'No añadiste ningún supervisor',
          ),
        );
      }
    });
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
    _controller.addListener(() {
      if (_controller.text.length == 12) {
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
