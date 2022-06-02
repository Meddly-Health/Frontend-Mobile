import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/user/view/profile/linked_accounts/widgets/custom_draggable_scrollable_sheet.dart';
import 'package:meddly/widgets/widgets.dart';

import '../../../../../../blocs.dart';
import '../../../../../../helpers/assets_provider.dart';
import '../../../../../models/user.dart';

List<User> fakeUsers = const [
  // User(id: '1', firstName: 'Juan', lastName: 'Perez'),
  // User(id: '2', firstName: 'Matias', lastName: 'Perez'),
];

class UserSupervisorsPage extends StatelessWidget {
  const UserSupervisorsPage({Key? key}) : super(key: key);

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
                  child: PageTitle(title: 'Supervisores'),
                ),
                _Supervisors(),
              ],
            ),
            const CustomDraggableScrollableSheet(
              type: CustomDraggableScrollableSheetType.supervisor,
            ),
          ],
        ),
      ),
    );
  }
}

class _Supervisors extends StatelessWidget {
  const _Supervisors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (fakeUsers.isEmpty) {
      return const Expanded(
          child: NoData(
        message: 'No añadiste ningún supervisor',
      ));
    }

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.currentUser!.supervisors == null ||
            state.currentUser!.supervisors!.isEmpty) {
          return const Expanded(
            child: NoData(
              message: 'No añadiste ningún supervisor',
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          padding: defaultPadding,
          itemCount: state.currentUser!.supervisors!.length,
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
      },
    );
  }
}
