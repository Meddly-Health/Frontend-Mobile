import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/helpers/assets_provider.dart';

import 'package:meddly/routes/router.dart';
import 'package:meddly/user/repository/respository.dart';

import '../../blocs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.user.isEmpty) {
          AutoRouter.of(context)
              .pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
        }
      },
      child: BlocProvider(
        create: (_) => UserBloc(RepositoryProvider.of<UserRepository>(context),
            RepositoryProvider.of<AuthenticationRepository>(context))
          ..add(UserLoading()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return AutoTabsScaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBarBuilder: (context, tabsRouter) => AppBar(
                      leading: const AutoBackButton(),
                    ),
                routes: const [
                  CalendarRoute(),
                  CalendarRoute(),
                  CalendarRoute(),
                  CalendarRoute(),
                  UserRouter(),
                ],
                bottomNavigationBuilder: (context, tabsRouter) {
                  return _BottomNavBar(
                      currentIndex: tabsRouter.activeIndex,
                      setActiveIndex: (int? index) {
                        tabsRouter.setActiveIndex(index!);
                      });
                });
          },
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.setActiveIndex,
  }) : super(key: key);

  final int currentIndex;
  final Function(int? index) setActiveIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BottomNavBarItem(
                    icon: AssetsProvider.calendarIcon,
                    onTap: () => setActiveIndex(0),
                    isPressed: currentIndex == 0),
                _BottomNavBarItem(
                    icon: AssetsProvider.diagnosisIcon,
                    onTap: () => setActiveIndex(1),
                    isPressed: currentIndex == 1),
                _BottomNavBarItem(
                    icon: AssetsProvider.pulseIcon,
                    onTap: () => setActiveIndex(2),
                    isPressed: currentIndex == 2),
                _BottomNavBarItem(
                    icon: AssetsProvider.pillIcon,
                    onTap: () => setActiveIndex(3),
                    isPressed: currentIndex == 3),
                _BottomNavBarItem(
                    icon: AssetsProvider.profileIcon,
                    onTap: () => setActiveIndex(4),
                    isPressed: currentIndex == 4)
              ],
            ),
            const SizedBox(height: 10),
            _BottomNavBarDot(currentIndex: currentIndex),
          ],
        ),
      ),
    );
  }
}

class _BottomNavBarDot extends StatelessWidget {
  const _BottomNavBarDot({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          left: MediaQuery.of(context).size.width / 11.5 +
              ((MediaQuery.of(context).size.width / 5) * currentIndex),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 6,
            width: 12,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(999)),
          ),
        ),
      ]),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem(
      {Key? key,
      required this.icon,
      required this.onTap,
      required this.isPressed})
      : super(key: key);

  final String icon;
  final VoidCallback onTap;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 26,
        height: 26,
        child: SvgPicture.asset(
          icon,
          color: isPressed
              ? Theme.of(context).colorScheme.secondaryContainer
              : Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.5),
        ),
      ),
    );
  }
}
