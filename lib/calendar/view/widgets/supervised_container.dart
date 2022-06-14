import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_repository/user_repository.dart';

import '../../../blocs.dart';
import '../../../helpers/assets_provider.dart';

class SupervisedContainer extends StatelessWidget {
  const SupervisedContainer({
    Key? key,
    required this.supervised,
  }) : super(key: key);

  final User supervised;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: state.supervising == supervised
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                radius: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: SizedBox(
                      height: 20 * 25,
                      width: 20 * 25,
                      child: SvgPicture.asset(supervised.avatar != null
                          ? supervised.avatar!
                          : AssetsProvider.defaultAvatar)),
                ),
              ),
              const SizedBox(width: 16),
              Text('${supervised.firstName} ${supervised.lastName}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: state.supervising == supervised
                          ? Theme.of(context).colorScheme.secondary
                          : null)),
              const Spacer(),
              if (state.supervising == supervised)
                GestureDetector(
                  onTap: () {
                    context
                        .read<UserBloc>()
                        .add(UserChangedSupervisor(user: User.empty));
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AssetsProvider.cross,
                      color: Theme.of(context).colorScheme.secondary,
                      height: 12,
                      width: 12,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
