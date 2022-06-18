import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:meddly/calendar/view/widgets/supervised_container.dart';
import 'package:user_repository/user_repository.dart';

import '../../../helpers/assets_provider.dart';

class DismissTile extends StatelessWidget {
  const DismissTile({Key? key, required this.user, required this.onDismissed})
      : super(key: key);

  final User user;
  final Function onDismissed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Dismissible(
          direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              onDismissed();
            }
          },
          background: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
            ),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: _TrashAnimation(),
                ),
              ),
            ),
          ),
          key: Key(user.id.toString()),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: SvgPicture.asset(
                  AssetsProvider.defaultAvatar,
                ),
              ),
              title: Text(user.firstName!,
                  style: Theme.of(context).textTheme.bodyMedium),
              subtitle: Text(
                user.email!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.5),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DismissTileLoading extends StatelessWidget {
  const DismissTileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            color: const Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            const DefaultShimmer(
              child: CircleAvatar(
                radius: 30,
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 50,
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
        ));
  }
}

class _TrashAnimation extends StatefulWidget {
  const _TrashAnimation({Key? key}) : super(key: key);

  @override
  State<_TrashAnimation> createState() => __TrashAnimationState();
}

class __TrashAnimationState extends State<_TrashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: const Duration(milliseconds: 100),
      child: Lottie.asset(AssetsProvider.trashLottie, controller: _controller,
          onLoaded: (composition) async {
        _controller
          ..duration = composition.duration
          ..forward();
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
