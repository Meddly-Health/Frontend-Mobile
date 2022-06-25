import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/calendar/view/widgets/supervised_container.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/widgets/widgets.dart';

import '../../blocs.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(const GetUser());
    context.read<SupervisorsBloc>().add(const GetSupervisors());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                success: (user, _) {
                  if (user!.firstName == null) {
                    context.router.replace(SetupRoute());
                  } else {
                    context.router.replace(const HomeRouter());
                  }
                },
                error: (String errorMessage) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    getSnackBar(context, errorMessage, SnackBarType.error),
                  );
                });
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: defaultPadding,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultShimmer(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: darkGrey,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              DefaultShimmer(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: darkGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const DefaultShimmer(
                            child: CircleAvatar(
                              radius: 96 / 2,
                              backgroundColor: darkGrey,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      DefaultShimmer(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: darkGrey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      DefaultShimmer(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: darkGrey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const _LoadingContainer(),
                      const SizedBox(height: 16),
                      const _LoadingContainer(),
                      const SizedBox(height: 16),
                      const _LoadingContainer(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

class _LoadingContainer extends StatelessWidget {
  const _LoadingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultHorizontalPadding.copyWith(top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightGrey,
      ),
      child: Row(
        children: [
          const DefaultShimmer(
            child: CircleAvatar(
              backgroundColor: darkGrey,
              radius: 66 / 2,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultShimmer(
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: darkGrey,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DefaultShimmer(
                child: Container(
                  width: MediaQuery.of(context).size.width / 6,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: darkGrey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 35),
          Expanded(
            child: DefaultShimmer(
              child: Container(
                height: 66,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: darkGrey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
