import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meddly/helpers/assets_provider.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/widgets/widgets.dart';

class UserLinkedAccountsPage extends StatelessWidget {
  const UserLinkedAccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(title: 'Cuentas vinculadas'),
            const SizedBox(height: 30),
            Text(
              'Los supervisores pueden acceder a tus datos para ayudarte con tus seguimiento.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .color!
                      .withOpacity(0.5)),
            ),
            const SizedBox(height: 16),
            IconAndTextTileItem(
                label: 'Supervisores',
                asset: AssetsProvider.linkedUsersIcon,
                onTap: () => context.router.push(const UserSupervisorsRoute())),
            const SizedBox(height: 30),
            Text(
              'Los supervisados son usuarios a los cuales tú puedes acceder a su seguimiento.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .color!
                      .withOpacity(0.5)),
            ),
            const SizedBox(height: 16),
            IconAndTextTileItem(
                label: 'Supervisados',
                asset: AssetsProvider.linkedUsersIcon,
                onTap: () => context.router.push(const UserSupervisedRoute())),
          ],
        ),
      ),
    );
  }
}

// class _SupervisedBy extends StatelessWidget {
//   const _SupervisedBy({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         shrinkWrap: true,
//         itemCount: fakeUsers.length,
//         itemBuilder: (context, index) => Container(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               child: Row(
//                 children: [
//                   const CircleAvatar(
//                     backgroundColor: Color(0xff95D6A4),
//                     radius: 24,
//                   ),
//                   const SizedBox(width: 16),
//                   Text(
//                     '${fakeUsers[index].firstName} ${fakeUsers[index].lastName}',
//                     style: Theme.of(context).textTheme.bodyMedium,
//                   ),
//                   const Spacer(),
//                   SizedBox(
//                       height: 20,
//                       width: 20,
//                       child: SvgPicture.asset(AssetsProvider.trashIcon))
//                 ],
//               ),
//             ));
//   }
// }


