// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/setup/view/finish_page.dart';
import 'package:meddly/setup/view/height_weight_page.dart';
import 'package:user_repository/user_repository.dart';

import 'package:meddly/blocs.dart';

import '../../helpers/constants.dart';
import '../../widgets/widgets.dart';
import 'avatar_page.dart';
import 'birthdate_page.dart';
import 'gender_page.dart';
import 'name_and_lastname_page.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({Key? key, this.title = 'Bienvenido a Meddly!'})
      : super(key: key);

  final String title;

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  late final PageController pageController;
  late final User? currentUser;

  @override
  void initState() {
    pageController = PageController();
    context.read<UserBloc>().add(GetUser());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body: state.status != UserStatus.success
                ? const Center(child: Loading())
                : BlocProvider(
                    create: (context) => SetupCubit(
                        RepositoryProvider.of<UserRepository>(context),
                        RepositoryProvider.of<AuthenticationRepository>(
                            context))
                      ..pageController = pageController
                      ..init(true, context.read<UserBloc>().state.currentUser),
                    child: Scaffold(
                      appBar: AppBar(),
                      body: BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state.status == UserStatus.loading) {
                            return const Center(child: Loading());
                          }

                          return GestureDetector(
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: SafeArea(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Padding(
                                  //   padding:
                                  //       defaultPadding.copyWith(bottom: 16),
                                  //   child: Text('Completa con tus datos',
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .titleLarge),
                                  // ),
                                  Expanded(
                                    child: PageView(
                                      controller: pageController,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: const [
                                        _PageViewChild(
                                            child: NameAndLastNamePage()),
                                        _PageViewChild(child: GenderPage()),
                                        _PageViewChild(child: BirthDatePage()),
                                        _PageViewChild(
                                            child: HeightWeightPage()),
                                        _PageViewChild(child: AvatarPage()),
                                        _PageViewChild(child: FinishPage()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ));
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class _PageViewChild extends StatelessWidget {
  const _PageViewChild({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var bodyHeight = MediaQuery.of(context).size.height -
          Scaffold.of(context).appBarMaxHeight! -
          defaultPadding.vertical -
          kBottomNavigationBarHeight;
      return SingleChildScrollView(
        child: Container(
          padding: defaultPadding,
          height: bodyHeight,
          child: child,
        ),
      );
    });
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
