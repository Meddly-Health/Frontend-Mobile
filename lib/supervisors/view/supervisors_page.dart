import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/constants.dart';
import 'widgets/dismiss_tile.dart';
import '../../widgets/widgets.dart';

import '../../../../../../blocs.dart';

class SupervisorsPage extends StatefulWidget {
  const SupervisorsPage({Key? key}) : super(key: key);

  @override
  State<SupervisorsPage> createState() => _SupervisorsPageState();
}

class _SupervisorsPageState extends State<SupervisorsPage> {
  @override
  void initState() {
    context.read<SupervisorsBloc>().add(const GetSupervisors());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupervisorsBloc, SupervisorsState>(
      listener: (context, state) {
        state.whenOrNull(deleted: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(context, 'Supervisor eliminado con éxito.',
                SnackBarType.success),
          );
          context.read<SupervisorsBloc>().add(const GetSupervisors());
        }, error: (errorMessage) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, errorMessage, SnackBarType.error));
        });
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: FadeIn(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: defaultPadding,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PageTitle(
                            title: 'Supervisores',
                            onPop: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                          const SizedBox(height: 25),
                          const _Supervisors(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Supervisors extends StatelessWidget {
  const _Supervisors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupervisorsBloc, SupervisorsState>(
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => const Center(
                  child: NoData(
                    message: 'No añadiste ningún supervisor',
                  ),
                ),
            loading: () => const _Loading(),
            success: (supervisors, _) {
              if (supervisors!.isEmpty) {
                return const Center(
                  child: NoData(
                    message: 'No añadiste ningún supervisor',
                  ),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: supervisors.length,
                itemBuilder: (context, index) => DismissTile(
                    user: supervisors[index],
                    onDismissed: () {
                      context
                          .read<SupervisorsBloc>()
                          .add(DeleteSupervisor(id: supervisors[index].id!));
                    }),
              );
            });
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DismissTileLoading(),
        DismissTileLoading(),
      ],
    );
  }
}
