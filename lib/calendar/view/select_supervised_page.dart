import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/calendar/view/widgets/supervised_container.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/widgets/widgets.dart';

import '../../blocs.dart';

class SelectSupervisedPage extends StatelessWidget {
  const SelectSupervisedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        child: Container(
          padding: defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTitle(title: 'Elegir supervisado'),
              const SizedBox(height: 16),
              BlocBuilder<SupervisorsBloc, SupervisorsState>(
                builder: (context, state) {
                  if (state.status == SupervisorsStatus.loading) {
                    return const Center(child: Loading());
                  }

                  if (state.supervised == null) {
                    return Container();
                  }
                  return Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        itemCount: state.supervised!.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                context.read<UserBloc>().add(
                                    UserChangedSupervisor(
                                        user: state.supervised![index]));

                                context.router.pop();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: SupervisedContainer(
                                    supervised: state.supervised![index]),
                              ),
                            )),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
