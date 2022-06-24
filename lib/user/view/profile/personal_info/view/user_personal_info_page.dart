import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../../../../blocs.dart';
import '../../../../../helpers/constants.dart';
import '../../../../../widgets/no_data.dart';
import '../../../../../widgets/page_title.dart';

class UserPersonalInfoPage extends StatelessWidget {
  const UserPersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: defaultPadding,
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const NoData(message: 'Error 404'),
                  success: (user, _) => _OnSuccess(user: user!));
            },
          ),
        ),
      ),
    );
  }
}

class _OnSuccess extends StatelessWidget {
  const _OnSuccess({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    var height = user.height ?? '';
    var weight = user.weight ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageTitle(title: 'Información personal'),
        const SizedBox(height: 35),
        Text('Peso: $weight',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        Text('Altura: $height',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
