import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/assets_provider.dart';
import '../../helpers/constants.dart';
import '../../routes/router.dart';
import '../cubit/welcome_cubit.dart';

List pages = [
  _PageViewBody.diagnosis(),
  _PageViewBody.pills(),
  _PageViewBody.treatment(),
];

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit()..init(),
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                BlocBuilder<WelcomeCubit, WelcomeState>(
                  builder: (context, state) {
                    return Expanded(
                      flex: 5,
                      child: PageView.builder(
                        controller: context.read<WelcomeCubit>().pageController,
                        itemBuilder: (BuildContext context, int index) {
                          return pages[index % 3];
                        },
                      ),
                    );
                  },
                ),
                const Spacer(),
                Column(
                  children: [
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
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Expanded(child: _LogInButton()),
                        Expanded(child: _SignInButton()),
                      ],
                    )
                  ],
                )
              ],
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
    return BlocBuilder<WelcomeCubit, WelcomeState>(
      builder: (context, state) {
        return AnimatedContainer(
          width: currentPage ? 30 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: currentPage
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          duration: const Duration(milliseconds: 300),
        );
      },
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 4, child: SvgPicture.asset(asset)),
          const SizedBox(height: 30),
          Column(
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('__sign_in_welcome__'),
      onTap: () {
        HapticFeedback.lightImpact();
        AutoRouter.of(context).push(const SignUpRoute());
      },
      child: Container(
          height: 64,
          margin: defaultPadding,
          padding: defaultPadding,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 2, color: Theme.of(context).colorScheme.primary)),
          child: Center(
              child: AutoSizeText(
            'Regístrate',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ))),
    );
  }
}

class _LogInButton extends StatelessWidget {
  const _LogInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('__log_in_welcome__'),
      onTap: () {
        HapticFeedback.lightImpact();
        AutoRouter.of(context).push(const LoginRoute());
      },
      child: Container(
          height: 64,
          margin: defaultPadding,
          padding: defaultPadding,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: AutoSizeText(
            'Inicia sesión',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ))),
    );
  }
}
