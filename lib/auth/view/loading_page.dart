import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../routes/router.dart';
import '../../widgets/widgets.dart';

import '../../blocs.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(UserGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state.status == UserStatus.success) {
                if (state.currentUser!.firstName == null) {
                  context.router.replace(const SetupRoute());
                } else {
                  context.router.replace(const HomeRouter());
                }
              }
            },
            builder: (context, state) {
              // TODO: Change loading page ....

              return const Center(child: Loading());
            },
          ),
        );
      },
    );
  }
}
