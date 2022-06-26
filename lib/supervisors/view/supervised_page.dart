import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/constants.dart';

import '../../../../../../blocs.dart';
import '../../../../../../widgets/widgets.dart';
import 'widgets/dismiss_tile.dart';

class SupervisedPage extends StatefulWidget {
  const SupervisedPage({Key? key}) : super(key: key);

  @override
  State<SupervisedPage> createState() => _SupervisedPageState();
}

class _SupervisedPageState extends State<SupervisedPage> {
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
            getSnackBar(context, 'Supervisado eliminado con éxito.',
                SnackBarType.success),
          );
          context.read<SupervisorsBloc>().add(const GetSupervisors());
        }, error: (errorMessage) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, errorMessage, SnackBarType.error));
        });
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: FadeIn(
            child: Column(
              children: [
                Container(
                  padding: defaultPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PageTitle(
                        title: 'Supervisados',
                        onPop: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                      const SizedBox(height: 25),
                      const _Supervised(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Supervised extends StatelessWidget {
  const _Supervised({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupervisorsBloc, SupervisorsState>(
        builder: (context, state) {
      return state.maybeWhen(
        orElse: () => const Center(
            child: NoData(message: 'No añadiste ningún supervisado')),
        loading: () => const _Loading(),
        success: (_, supervised) {
          if (supervised!.isEmpty) {
            return const Center(
                child: NoData(message: 'No añadiste ningún supervisado'));
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: supervised.length,
            itemBuilder: (context, index) => DismissTile(
              user: supervised[index],
              onDismissed: () {
                context.read<SupervisorsBloc>().add(
                      DeleteSupervised(id: supervised[index].id!),
                    );
              },
            ),
          );
        },
      );
    });
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
