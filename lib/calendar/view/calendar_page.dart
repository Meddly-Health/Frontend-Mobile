import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/helpers/assets_provider.dart';
import '../../helpers/constants.dart';
import '../../widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';
import 'dart:math' as math;

import '../../blocs.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status != UserStatus.success) {
            return const Center(child: Loading());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetsProvider.bell),
              const SizedBox(height: 16),
              const _NameAndAvatar(),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 5,
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _SupervisorDropdownButton(),
                  _DateDropdownButton(),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

class _DateDropdownButton extends StatelessWidget {
  const _DateDropdownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Container(
            padding: defaultPadding.copyWith(top: 5, bottom: 5),
            width: (MediaQuery.of(context).size.width / 2) - 20,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    elevation: 0,
                    value:
                        DateTime.now().toUtc().toIso8601String().split('T')[0],
                    hint: Text(
                        DateTime.now().toUtc().toIso8601String().split('T')[0],
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary)),
                    borderRadius: BorderRadius.circular(20),
                    icon: Transform.rotate(
                      angle: math.pi / 2,
                      child: SvgPicture.asset(
                        AssetsProvider.chevron,
                        height: 12,
                        width: 12,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    dropdownColor: Theme.of(context).colorScheme.primary,
                    iconDisabledColor: Colors.transparent,
                    iconEnabledColor: Theme.of(context).colorScheme.secondary,
                    items: const [],
                    onChanged: (String? date) {})));
      },
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
        return Container(
            padding: defaultPadding.copyWith(top: 5, bottom: 5),
            width: (MediaQuery.of(context).size.width / 2) - 20,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<User>(
                    value: state.supervising,
                    hint: Text('Mis datos',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary)),
                    borderRadius: BorderRadius.circular(20),
                    icon: state.currentUser != null &&
                            state.currentUser!.supervised!.isEmpty
                        ? Container()
                        : Transform.rotate(
                            angle: math.pi / 2,
                            child: SvgPicture.asset(AssetsProvider.chevron,
                                height: 12,
                                width: 12,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                    dropdownColor: Theme.of(context).colorScheme.primary,
                    iconDisabledColor: Colors.transparent,
                    items: state.currentUser?.supervised == null
                        ? []
                        : [
                            DropdownMenuItem(
                              child: Text(
                                'Mis datos',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                              value: state.currentUser,
                            ),
                            ...?state.currentUser?.supervised!
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
                          ],
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

class _NameAndAvatar extends StatelessWidget {
  const _NameAndAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                state.currentUser?.firstName != null
                    ? 'Buenos días, ${state.currentUser?.firstName}'
                    : 'Buenos días',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
                maxFontSize: Theme.of(context).textTheme.titleLarge!.fontSize!,
              ),
            ),
            const Avatar()
          ],
        );
      },
    );
  }
}
