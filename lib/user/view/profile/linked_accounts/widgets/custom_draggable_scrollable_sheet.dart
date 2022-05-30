import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/widgets/spinner.dart';

import '../../../../../helpers/assets_provider.dart';
import '../../../../../helpers/constants.dart';

class CustomDraggableScrollableSheet extends StatefulWidget {
  const CustomDraggableScrollableSheet({
    Key? key,
  }) : super(key: key);

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
          return _DraggableScrollableSheetContent(
            scrollController: scrollController,
          );
        });
  }
}

class _DraggableScrollableSheetContent extends StatelessWidget {
  const _DraggableScrollableSheetContent({
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
                    'Ingresa el link de invitación ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: Theme.of(context).textTheme.bodyMedium,
                textInputAction: TextInputAction.done,
                onChanged: (value) {},
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
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
                  hintText: 'Pega aquí el link  de invitación',
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!
                            .withOpacity(0.5),
                      ),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.content_copy,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const _Loading(),
            ],
          ),
        ));
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
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
