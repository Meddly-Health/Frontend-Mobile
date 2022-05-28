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

class UserSupervisorsPage extends StatelessWidget {
  const UserSupervisorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: defaultPadding,
            child: PageTitle(title: 'Supervisores'),
          ),
          _Supervisors(),
        ],
      ),
    );
  }
}

class _Supervisors extends StatelessWidget {
  const _Supervisors({Key? key}) : super(key: key);

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
