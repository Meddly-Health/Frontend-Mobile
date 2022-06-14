import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs.dart';
import '../../../helpers/constants.dart';

class OmitButton extends StatelessWidget {
  const OmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: defaultPadding,
        alignment: Alignment.center,
        child: Text.rich(TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                HapticFeedback.lightImpact();
                context.read<SetupCubit>().pageController!.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              },
            text: 'Omitir')));
  }
}
