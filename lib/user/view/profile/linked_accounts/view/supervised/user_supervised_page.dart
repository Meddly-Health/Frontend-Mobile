import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/helpers/constants.dart';

import '../../../../../../blocs.dart';
import '../../../../../../helpers/assets_provider.dart';
import '../../../../../../widgets/widgets.dart';
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
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.status == UserStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, 'Sucess.', SnackBarType.success));
        }
      },
      child: Scaffold(
        body: FadeIn(
          child: SizedBox(
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
                const CustomDraggableScrollableSheet(
                  type: CustomDraggableScrollableSheetType.supervised,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Supervised extends StatelessWidget {
  const _Supervised({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.currentUser!.supervised == null ||
            state.currentUser!.supervised!.isEmpty) {
          return const Expanded(
            child: NoData(message: 'No añadiste ningún supervisado'),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          padding: defaultPadding,
          itemCount: state.currentUser!.supervised?.length,
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
                  '${state.currentUser!.supervised![index].firstName} ${state.currentUser!.supervised![index].lastName}',
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
