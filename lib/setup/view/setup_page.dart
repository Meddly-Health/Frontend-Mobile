import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/routes/router.dart';
import 'package:user_repository/user_repository.dart';

import 'package:meddly/blocs.dart';

import '../../helpers/constants.dart';
import '../../widgets/widgets.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 0,
                  ),
                  body: const Center(
                    child: Loading(),
                  ),
                ),
            success: (user, _) => BlocProvider(
                  create: (context) => SetupCubit(
                      RepositoryProvider.of<UserRepository>(context),
                      RepositoryProvider.of<AuthenticationRepository>(context))
                    ..init(),
                  child: BlocBuilder<SetupCubit, SetupState>(
                    builder: (context, state) {
                      return state.setupStatus == SetupStatus.loading
                          ? const Scaffold(body: Center(child: Loading()))
                          : AutoTabsScaffold(
                              appBarBuilder: ((context, tabsRouter) {
                                context.read<SetupCubit>().tabsRouter =
                                    tabsRouter;
                                return AppBar(
                                  title:
                                      Text('${tabsRouter.activeIndex + 1}/4'),
                                  titleTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                  leading: tabsRouter.activeIndex != 0
                                      ? MeddlyBackButton(
                                          onTap: () =>
                                              tabsRouter.setActiveIndex(
                                                  tabsRouter.activeIndex - 1),
                                        )
                                      : Container(),
                                  actions: tabsRouter.activeIndex == 3
                                      ? null
                                      : [
                                          GestureDetector(
                                            onTap: () {
                                              tabsRouter.setActiveIndex(
                                                  tabsRouter.activeIndex + 1);
                                            },
                                            child: Container(
                                              padding: defaultPadding,
                                              child: Text(
                                                'Omitir',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ),
                                          )
                                        ],
                                );
                              }),
                              routes: const [
                                SetupSexRoute(),
                                SetupHeightWeightRoute(),
                                SetupAvatarRoute(),
                                SetupDoneRoute()
                              ],
                            );
                    },
                  ),
                ));
      },
    );
  }
}

// TODO: Remove

class _InformationText extends StatelessWidget {
  const _InformationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: 'La información de esta página ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .color!
                  .withOpacity(0.5))),
      TextSpan(
          text: 'se utiliza ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .color!
                  .withOpacity(0.5),
              fontWeight: FontWeight.bold)),
      TextSpan(
          text: 'para tus evaluaciones. ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .color!
                  .withOpacity(0.5))),
      TextSpan(
          recognizer: TapGestureRecognizer()..onTap = () {},
          text: 'Mas información ',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: const Color(0xff53ACFF))),
    ]));
  }
}
