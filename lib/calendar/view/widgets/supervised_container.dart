import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
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
                  behavior: HitTestBehavior.translucent,
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

class SupervisedContainerLoading extends StatelessWidget {
  const SupervisedContainerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const DefaultShimmer(
                child: CircleAvatar(
                    backgroundColor: Color(0xffD9D9D9), radius: 25),
              ),
              const SizedBox(width: 16),
              SizedBox(
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultShimmer(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(5)),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 23,
                      ),
                    ),
                    const Spacer(),
                    DefaultShimmer(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(5)),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 18,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class DefaultShimmer extends StatelessWidget {
  const DefaultShimmer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: child,
        baseColor: const Color(0xffD9D9D9),
        highlightColor: const Color(0xffE5E5E5));
  }
}
