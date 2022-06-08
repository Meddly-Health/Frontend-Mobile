import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helpers/assets_provider.dart';

import '../../routes/router.dart';

import '../../blocs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.user.isEmpty) {
          AutoRouter.of(context).pushAndPopUntil(const LoginRoute(),
              predicate: ((route) => false));
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return AutoTabsScaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBarBuilder: (context, tabsRouter) => AppBar(
                    leading: const AutoBackButton(),
                  ),
              routes: const [
                CalendarRoute(),
                DiagnosisRoute(),
                MeasurementesRoute(),
                MedicineRoute(),
                UserRouter(),
              ],
              bottomNavigationBuilder: (context, tabsRouter) {
                return _BottomNavBar(
                    currentIndex: tabsRouter.activeIndex,
                    setActiveIndex: (int? index) {
                      if (tabsRouter.activeIndex != index) {
                        tabsRouter.setActiveIndex(index!);
                      }
                      AutoRouter.of(context).pop();
                    });
              });
        },
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
                    onTap: () {
                      if (currentIndex != 0) {
                        setActiveIndex(0);
                      } else {
                        AutoRouter.of(context).pop();
                      }
                    },
                    isPressed: currentIndex == 0),
                _BottomNavBarItem(
                    icon: AssetsProvider.diagnosisIcon,
                    onTap: () {
                      if (currentIndex != 1) {
                        setActiveIndex(1);
                      } else {
                        AutoRouter.of(context).pop();
                      }
                    },
                    isPressed: currentIndex == 1),
                _BottomNavBarItem(
                    icon: AssetsProvider.pulseIcon,
                    onTap: () {
                      if (currentIndex != 2) {
                        setActiveIndex(2);
                      } else {
                        AutoRouter.of(context).pop();
                      }
                    },
                    isPressed: currentIndex == 2),
                _BottomNavBarItem(
                    icon: AssetsProvider.pillIcon,
                    onTap: () {
                      if (currentIndex != 3) {
                        setActiveIndex(3);
                      } else {
                        AutoRouter.of(context).pop();
                      }
                    },
                    isPressed: currentIndex == 3),
                _BottomNavBarItem(
                    icon: AssetsProvider.profileIcon,
                    onTap: () {
                      if (currentIndex != 4) {
                        setActiveIndex(4);
                      } else {
                        AutoRouter.of(context).pop();
                      }
                    },
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
  final Function onTap;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        HapticFeedback.lightImpact();

        onTap();
      },
      child: Container(
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(2),
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
