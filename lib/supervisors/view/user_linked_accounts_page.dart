import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:meddly/routes/router.dart';

import '../../blocs.dart';
import '../../helpers/assets_provider.dart';
import '../../helpers/constants.dart';
import '../../helpers/helpers.dart';
import '../../widgets/widgets.dart';

class UserLinkedAccountsPage extends StatelessWidget {
  const UserLinkedAccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupervisorsBloc, SupervisorsState>(
      listener: (context, state) {
        state.whenOrNull(deleted: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(context, 'Supervisor eliminado con éxito.',
                SnackBarType.success),
          );
          context.read<SupervisorsBloc>().add(const GetSupervisors());
        }, added: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(
                context, 'Supervisor añadido con éxito.', SnackBarType.success),
          );
          context.read<SupervisorsBloc>().add(const GetSupervisors());
        }, error: (errorMessage) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
              context,
              'El código es incorrecto o ya ha sido utilizado.',
              SnackBarType.error));
        });
      },
      child: Scaffold(
        body: FadeIn(
          child: SingleChildScrollView(
            child: Container(
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTitle(
                    title: 'Cuentas vinculadas',
                    onPop: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SvgPicture.asset(
                      AssetsProvider.supervisorsVector,
                      width: MediaQuery.of(context).size.height / 3,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const _Buttons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        children: [
          _Button(
              title: 'Supervisores',
              description:
                  'Los supervisores pueden acceder a tus datos para ayudarte con tu seguimiento.',
              onTap: () {
                HapticFeedback.lightImpact();
                context.router.navigate(const SupervisorsRoute());
              }),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          _Button(
              title: 'Supervisados',
              description:
                  'Los supervisados son pacientes a los cuales tú puedes acceder a su seguimiento.',
              onTap: () {
                HapticFeedback.lightImpact();
                context.router.navigate(const SupervisedRoute());
              }),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          _Button(
            title: 'Ingresar código',
            description:
                'Ingrese el código de supervisor que recibió por correo electrónico o mensaje de texto.',
            onTap: () {
              HapticFeedback.lightImpact();
              showModalBottomSheet(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => const _InsertCodeModalBottomSheet());
            },
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          _Button(
            title: 'Obtener mi código',
            description:
                'Comparta su seguimiento y progreso con amigos o familiares.',
            onTap: () {
              HapticFeedback.lightImpact();
              showModalBottomSheet(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => const _GetCodeModalBottomSheet());
            },
          ),
        ],
      ),
    );
  }
}

class _InsertCodeModalBottomSheet extends StatelessWidget {
  const _InsertCodeModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Ingrese aquí el código de verificación que recibió por correo electrónico o mensaje de texto. Al continuar, usted acepta nuestros términos y ha leído nuestra política de privacidad.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .color!
                      .withOpacity(0.4),
                ),
            textAlign: TextAlign.justify,
          ),
          const _InsertCodeField(),
        ],
      ),
    );
  }
}

class _GetCodeModalBottomSheet extends StatelessWidget {
  const _GetCodeModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Comparta su seguimiento y progreso con amigos o familiares, copiando el siguiente código. Este código es válido para un único paciente, una vez utilizado, se creará uno nuevo.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .color!
                      .withOpacity(0.4),
                ),
            textAlign: TextAlign.justify,
          ),
          const _GetCodeField(),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                AutoSizeText(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(AssetsProvider.chevron, height: 20)
        ],
      ),
    );
  }
}

class _InsertCodeField extends StatefulWidget {
  const _InsertCodeField({
    Key? key,
  }) : super(key: key);

  @override
  State<_InsertCodeField> createState() => _InsertCodeFieldState();
}

class _InsertCodeFieldState extends State<_InsertCodeField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();

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
            onFieldSubmitted: (String value) {
              if (value.length == 12) {
                BlocProvider.of<SupervisorsBloc>(context)
                    .add(AddSupervised(code: value));
                BlocProvider.of<UserBloc>(context).add(const GetUser());
              }
            },
            keyboardType: TextInputType.text,
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
              fillColor: Theme.of(context).scaffoldBackgroundColor,
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
                  AssetsProvider.paste,
                  height: 18,
                  width: 24,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GetCodeField extends StatefulWidget {
  const _GetCodeField({
    Key? key,
  }) : super(key: key);

  @override
  State<_GetCodeField> createState() => _GetCodeFieldState();
}

class _GetCodeFieldState extends State<_GetCodeField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    context.read<UserBloc>().state.maybeWhen(
        orElse: () => null,
        success: (user, _) {
          _controller.text = user!.invitation!;
        });

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
              fillColor: Theme.of(context).scaffoldBackgroundColor,
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
