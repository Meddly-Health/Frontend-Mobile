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
    context.read<SupervisorsBloc>().add(const GetSupervisors());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar supervisado'),
        leading: const MeddlyBackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<SupervisorsBloc, SupervisorsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () => const Center(
                            child: NoData(
                                message: 'No hay supervisados disponibles'),
                          ),
                      loading: () => const _LoadingSupervised(),
                      success: (_, supervised) {
                        if (supervised!.isEmpty) {
                          return const Center(
                            child: NoData(
                                message: 'No hay supervisados disponibles'),
                          );
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...supervised
                                .map((supervised) => GestureDetector(
                                      onTap: () {
                                        context.read<UserBloc>().add(
                                            UserEvent.changeSupervisor(
                                                supervised));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: SupervisedContainer(
                                            supervised: supervised),
                                      ),
                                    ))
                                .toList()
                          ],
                        );
                      });
                },
              ),
            ],
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
