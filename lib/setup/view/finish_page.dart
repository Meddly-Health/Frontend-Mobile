import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../blocs.dart';
import '../../helpers/assets_provider.dart';
import '../../routes/router.dart';
import '../../widgets/widgets.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 3,
              child: Lottie.asset(AssetsProvider.medic3),
            ),
            Text(
              '¡Su perfil se ha completado con éxito!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(
              flex: 2,
            ),
            const SizedBox(height: 16),
            BlocBuilder<SetupCubit, SetupState>(
              builder: (context, state) {
                return Button(
                    enabled: true,
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      context.router.pushAndPopUntil(const LoadingRoute(),
                          predicate: (route) => false);
                    },
                    animate: false,
                    enabledColor: Theme.of(context).colorScheme.primary,
                    disbaledColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    labelColor: Theme.of(context).colorScheme.secondary,
                    label: 'Comenzar ahora!',
                    keyString: 'omit');
              },
            )
          ],
        ),
        Positioned(
            top: 0,
            child: SizedBox(
                height: 100,
                width: 100,
                child: Lottie.asset(AssetsProvider.fireworks))),
        Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset(AssetsProvider.fireworks)))
      ],
    );
  }
}
