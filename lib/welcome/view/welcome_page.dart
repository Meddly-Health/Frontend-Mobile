import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:meddly/helpers/assets_provider.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/welcome/cubit/welcome_cubit.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit()..init(),
      child: Scaffold(
        appBar: AppBar(),
        body: FadeIn(
          child: SizedBox(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BlocBuilder<WelcomeCubit, WelcomeState>(
                        builder: (context, state) {
                          return Container(
                            margin: const EdgeInsets.only(top: 30),
                            height: MediaQuery.of(context).size.height / 2,
                            child: Expanded(
                              child: PageView(
                                controller:
                                    context.read<WelcomeCubit>().pageController,
                                children: [
                                  _PageViewBody.diagnosis(),
                                  _PageViewBody.pills(),
                                  _PageViewBody.treatment(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      BlocBuilder<WelcomeCubit, WelcomeState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 15),
                              _PageIndicator(state.currentPage == 0),
                              const SizedBox(width: 15),
                              _PageIndicator(state.currentPage == 1),
                              const SizedBox(width: 15),
                              _PageIndicator(state.currentPage == 2),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  const _WelcomeButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator(
    this.currentPage, {
    Key? key,
  }) : super(key: key);

  final bool currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color:
            currentPage ? Theme.of(context).colorScheme.primary : Colors.grey,
        borderRadius: BorderRadius.circular(999),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}

class _PageViewBody extends StatelessWidget {
  const _PageViewBody({
    Key? key,
    required this.asset,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String asset;
  final String title;
  final String description;

  factory _PageViewBody.diagnosis() => const _PageViewBody(
      asset: AssetsProvider.diagnosis,
      title: 'Realiza un auto diagnóstico',
      description:
          'A través del ingreso de síntomas o por un escáner, descubre cuál podría ser tu diagnóstico.');

  factory _PageViewBody.pills() => const _PageViewBody(
      asset: AssetsProvider.pills,
      title: 'Registra tus medicamentos',
      description:
          'Recibe recordatorios personalizados de tus medicamentos y citas con el médico.');

  factory _PageViewBody.treatment() => const _PageViewBody(
      asset: AssetsProvider.treatment,
      title: 'Sigue tu tratamiento',
      description:
          'Personaliza tu perfil de salud y lleva el control de tus datos con una cuenta gratuita.');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: SvgPicture.asset(asset)),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _WelcomeButton extends StatelessWidget {
  const _WelcomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('login_button'),
      onTap: () {
        AutoRouter.of(context)
            .pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
      },
      child: Container(
          height: 55,
          margin: defaultPadding,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text('Comenzar ahora',
                style: Theme.of(context).textTheme.labelMedium),
          )),
    );
  }
}
