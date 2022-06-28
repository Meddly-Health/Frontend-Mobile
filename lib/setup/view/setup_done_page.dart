import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:meddly/helpers/constants.dart';

import '../../blocs.dart';
import '../../helpers/assets_provider.dart';
import '../../routes/router.dart';
import '../../widgets/widgets.dart';

class SetupDonePage extends StatelessWidget {
  const SetupDonePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SetupCubit, SetupState>(
      listener: (context, state) async {
        if (state.setupStatus == SetupStatus.success) {
          HapticFeedback.lightImpact();
          await Future.delayed(const Duration(seconds: 1));
          context.router.pushAndPopUntil(const LoadingRoute(),
              predicate: (route) => false);
        } else if (state.setupStatus == SetupStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, state.errorMessage!, SnackBarType.error));
        }
      },
      child: Scaffold(
        body: Container(
          padding: defaultPadding,
          child: SafeArea(
            child: Stack(
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
                      double width = MediaQuery.of(context).size.width;

                      return GestureDetector(
                          key: const Key('login_button'),
                          onTap: () {
                            HapticFeedback.lightImpact();
                            context.read<SetupCubit>().saveUserData();
                          },
                          child: AnimatedContainer(
                            height: 64,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: state.setupStatus ==
                                          SetupStatus.loading ||
                                      state.setupStatus == SetupStatus.success
                                  ? BorderRadius.circular(99)
                                  : BorderRadius.circular(20),
                            ),
                            onEnd: () {},
                            width: state.setupStatus == SetupStatus.loading ||
                                    state.setupStatus == SetupStatus.success
                                ? 64
                                : width,
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.easeIn,
                            child: state.setupStatus == SetupStatus.loading
                                ? const LoadingButton()
                                : Center(
                                    child: FittedBox(
                                      child: state.setupStatus ==
                                              SetupStatus.success
                                          ? ElasticIn(
                                              child: SvgPicture.asset(
                                                AssetsProvider.success,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                            )
                                          : Text('Iniciar sesión',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary)),
                                    ),
                                  ),
                          ));
                    })
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
            ),
          ),
        ),
      ),
    );
  }
}
