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
import 'widgets/custom_draggable_scrollable_sheet.dart';

class SupervisedPage extends StatelessWidget {
  const SupervisedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupervisorsBloc, SupervisorsState>(
      listener: (context, state) {
        if (state.status == SupervisorsStatus.success) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
              context, 'Operación realizada con éxito.', SnackBarType.success));
        }
        if (state.status == SupervisorsStatus.error) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context,
              'Error. Verifique el código ingresado.', SnackBarType.error));
        }
      },
      child: Scaffold(
        body: FadeIn(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: defaultPadding,
                      child: PageTitle(
                        title: 'Supervisados',
                        onPop: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                    const _Supervised(),
                  ],
                ),
                const CustomDraggableScrollableSheet(
                  type: CustomDraggableScrollableSheetType.supervised,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Supervised extends StatelessWidget {
  const _Supervised({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupervisorsBloc, SupervisorsState>(
      builder: (context, state) {
        if (state.supervised == null || state.supervised!.isEmpty) {
          return const Expanded(
            child: NoData(message: 'No añadiste ningún supervisado'),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          padding: defaultPadding,
          itemCount: state.supervised?.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xff95D6A4),
                  radius: 24,
                ),
                const SizedBox(width: 16),
                Text(
                  '${state.supervised![index].firstName} ${state.supervised![index].lastName}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(AssetsProvider.trashIcon))
              ],
            ),
          ),
        );
      },
    );
  }
}

class DraggableScrollableSheetContentSupervised extends StatelessWidget {
  const DraggableScrollableSheetContentSupervised({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: defaultPadding.copyWith(bottom: 0),
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 3,
                width: 100,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(999)),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: SvgPicture.asset(AssetsProvider.linkIcon),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Ingresar código de invitación',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: _CodeFormFieldSupervised(),
              ),
              const SizedBox(height: 20),
              BlocBuilder<SupervisorsBloc, SupervisorsState>(
                builder: (context, state) {
                  if (state.status == SupervisorsStatus.loading) {
                    return const Loading();
                  }

                  return Container();
                },
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '''Ingrese aquí el código de verificación que recibió por correo electrónico o mensaje de texto.\n\nAl continuar,usted acepta nuestros términos y ha leído nuestra política de privacidad.''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
              )
            ],
          ),
        ));
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
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupervisorsBloc, SupervisorsState>(
      builder: (context, state) {
        return TextFormField(
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
        );
      },
    );
  }
}
