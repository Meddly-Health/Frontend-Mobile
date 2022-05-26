import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/user/models/user.dart';

import '../../blocs.dart';

final fakeUsers = [
  const User(id: '1', firstName: 'Leila'),
  const User(id: '2', firstName: 'Ignacio'),
];

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _NameNotifications(),
          SizedBox(height: 16),
          _SupervisorDropdownButton()
        ],
      ),
    );
  }
}

class _SupervisorDropdownButton extends StatelessWidget {
  const _SupervisorDropdownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.status != UserStatus.success) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container(
            padding: defaultPadding.copyWith(top: 5, bottom: 5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<User>(
                    elevation: 0,
                    value: state.currentUser!.supervising,
                    hint: Text('No estas supervisando a nadie',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary)),
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: Theme.of(context).colorScheme.primary,
                    iconEnabledColor: Theme.of(context).colorScheme.secondary,
                    items: fakeUsers
                        .map((user) => DropdownMenuItem(
                              child: Text(
                                user.firstName!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                              value: user,
                            ))
                        .toList(),
                    onChanged: (User? user) {
                      if (user == null) {
                        return;
                      }

                      context
                          .read<UserBloc>()
                          .add(UserChangedSupervisor(user: user));
                    })));
      },
    );
  }
}

class _NameNotifications extends StatelessWidget {
  const _NameNotifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                state.currentUser?.firstName != null
                    ? 'Buenos días, ${state.currentUser?.firstName}'
                    : 'Buenos días',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
              ),
            ),
            const Spacer(),
            const Icon(Icons.notifications)
          ],
        );
      },
    );
  }
}
