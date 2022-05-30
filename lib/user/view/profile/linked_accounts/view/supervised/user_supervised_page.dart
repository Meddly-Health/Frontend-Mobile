import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/helpers/constants.dart';

import '../../../../../../helpers/assets_provider.dart';
import '../../../../../../widgets/page_title.dart';
import '../../../../../models/user.dart';
import '../../widgets/custom_draggable_scrollable_sheet.dart';

List<User> fakeUsers = const [
  // User(id: '1', firstName: 'Juan', lastName: 'Perez'),
  // User(id: '2', firstName: 'Matias', lastName: 'Perez'),
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
            const CustomDraggableScrollableSheet(),
          ],
        ),
      ),
    );
  }
}

class _Supervised extends StatelessWidget {
  const _Supervised({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (fakeUsers.isEmpty) {
      return Expanded(
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(AssetsProvider.openBox),
            const SizedBox(height: 16),
            Text('No añadiste ningún supervisado',
                style: Theme.of(context).textTheme.bodyMedium),
            const Spacer(),
          ],
        ),
      );
    }

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
