// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:meddly/widgets/widgets.dart';

import '../../../blocs.dart';
import '../../../helpers/assets_provider.dart';
import '../../../helpers/constants.dart';
import '../supervised_page.dart';

class _DraggableScrollableSheetContentSupervisors extends StatelessWidget {
  const _DraggableScrollableSheetContentSupervisors({
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
                    'Obtener código de invitación',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state.status == UserStatus.loading) {
                    return const Loading();
                  }

                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: _CodeFormFieldSupervisors(),
                  );
                },
              ),
              const SizedBox(height: 25),
              // const _Loading(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Lorem ipsum ...',
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
        return TextFormField(
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
                await Clipboard.setData(ClipboardData(text: _controller.text));
                ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context,
                    'Código copiado al portapapeles', SnackBarType.success));
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

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spinner(color: Theme.of(context).colorScheme.secondary),
        const SizedBox(height: 16),
        Text(
          'Cargando..',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ],
    );
  }
}

class Error extends StatelessWidget {
  const Error({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 100,
            width: 100,
            child: SvgPicture.asset(AssetsProvider.exclamation)),
        const SizedBox(height: 16),
        Text(
          'Ocurrió un error.',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        const SizedBox(height: 16),
        Button(
            enabled: true,
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(UserGet());
            },
            animate: false,
            enabledColor: Theme.of(context).colorScheme.secondary,
            disbaledColor: Theme.of(context).colorScheme.secondary,
            labelColor: Theme.of(context).colorScheme.primary,
            label: 'Intentar nuevamente',
            keyString: '')
      ],
    );
  }
}

enum CustomDraggableScrollableSheetType { supervisor, supervised }

class CustomDraggableScrollableSheet extends StatefulWidget {
  const CustomDraggableScrollableSheet({
    Key? key,
    required this.type,
  }) : super(key: key);

  final CustomDraggableScrollableSheetType type;

  @override
  State<CustomDraggableScrollableSheet> createState() =>
      CustomDraggableScrollableSheetState();
}

class CustomDraggableScrollableSheetState
    extends State<CustomDraggableScrollableSheet> {
  late final DraggableScrollableController _scrollController;

  @override
  void initState() {
    _scrollController = DraggableScrollableController();
    _scrollController.addListener(() {
      if (_scrollController.size == 0.13) {
        FocusScope.of(context).unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.13,
        minChildSize: 0.13,
        snap: true,
        snapSizes: const [0.13, 0.5],
        maxChildSize: 0.5,
        controller: _scrollController,
        builder: (context, scrollController) {
          return (widget.type == CustomDraggableScrollableSheetType.supervisor)
              ? _DraggableScrollableSheetContentSupervisors(
                  scrollController: scrollController,
                )
              : DraggableScrollableSheetContentSupervised(
                  scrollController: scrollController,
                );
        });
  }
}
