import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/calendar/view/widgets/supervised_container.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/widgets/widgets.dart';

import '../../blocs.dart';

class SelectSupervisedPage extends StatefulWidget {
  const SelectSupervisedPage({Key? key}) : super(key: key);

  @override
  State<SelectSupervisedPage> createState() => _SelectSupervisedPageState();
}

class _SelectSupervisedPageState extends State<SelectSupervisedPage> {
  @override
  void initState() {
    context.read<SupervisorsBloc>().add(GetSupervisors());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FadeIn(
          child: Container(
            padding: defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const PageTitle(title: 'Elegir supervisado'),
                const SizedBox(height: 16),
                BlocBuilder<SupervisorsBloc, SupervisorsState>(
                  builder: (context, state) {
                    var supervised = state.supervised;
                    if (state.status == SupervisorsStatus.loading) {
                      return const _LoadingSupervised();
                    }

                    if (state.supervised!.isEmpty) {
                      return const Center(
                        child:
                            NoData(message: 'No hay supervisados disponibles'),
                      );
                    }

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...supervised!
                            .map((supervised) => GestureDetector(
                                  onTap: () {
                                    context.read<UserBloc>().add(
                                        UserChangedSupervisor(
                                            user: supervised));

                                    context.router.pop();
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: SupervisedContainer(
                                        supervised: supervised),
                                  ),
                                ))
                            .toList()
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingSupervised extends StatelessWidget {
  const _LoadingSupervised({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SupervisedContainerLoading(),
        SizedBox(height: 16),
        SupervisedContainerLoading(),
        SizedBox(height: 16),
        SupervisedContainerLoading(),
        SizedBox(height: 16),
        SupervisedContainerLoading(),
      ],
    );
  }
}
