import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/helpers/constants.dart';

import '../../../../../helpers/assets_provider.dart';
import '../../../../../widgets/page_title.dart';
import '../../../../models/user.dart';

List<User> fakeUsers = const [
  User(id: '1', firstName: 'Juan', lastName: 'Perez'),
  User(id: '2', firstName: 'Matias', lastName: 'Perez'),
];

class UserSupervisedPage extends StatelessWidget {
  const UserSupervisedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: const [
                Padding(
                  padding: defaultPadding,
                  child: PageTitle(title: 'Supervisados'),
                ),
                _Supervised(),
              ],
            ),
            const _DraggableScrollableSheet()
          ],
        ),
      ),
    );
  }
}

class _DraggableScrollableSheet extends StatefulWidget {
  const _DraggableScrollableSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<_DraggableScrollableSheet> createState() =>
      _DraggableScrollableSheetState();
}

class _DraggableScrollableSheetState extends State<_DraggableScrollableSheet> {
  late final DraggableScrollableController _scrollController;

  @override
  void initState() {
    _scrollController = DraggableScrollableController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.11,
        minChildSize: 0.11,
        snap: true,
        snapSizes: const [0.11, 0.5],
        maxChildSize: 0.5,
        controller: _scrollController,
        builder: (context, scrollController) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: defaultPadding.copyWith(bottom: 0),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 3,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(999)),
                    ),
                    const SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: SvgPicture.asset(AssetsProvider.linkIcon),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Ingresa el link de invitación ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        )
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}

class _Supervised extends StatelessWidget {
  const _Supervised({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: defaultPadding,
      itemCount: fakeUsers.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xff95D6A4),
              radius: 24,
            ),
            const SizedBox(width: 16),
            Text(
              '${fakeUsers[index].firstName} ${fakeUsers[index].lastName}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(AssetsProvider.trashIcon))
          ],
        ),
      ),
    );
  }
}
