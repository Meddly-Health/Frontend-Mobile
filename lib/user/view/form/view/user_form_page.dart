// import 'package:animate_do/animate_do.dart';
// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
// import '../../../../helpers/constants.dart';
// import '../../../../routes/router.dart';
// import 'user_form.dart';
// import '../../../../widgets/widgets.dart';
// import 'package:user_repository/user_repository.dart';

// import '../../../../blocs.dart';

// class UserFormPage extends StatelessWidget {
//   const UserFormPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UserFormCubit(
//         userRepository: RepositoryProvider.of<UserRepository>(context),
//         authenticationRepository:
//             RepositoryProvider.of<AuthenticationRepository>(context),
//       )..init(),
//       child: BlocListener<UserBloc, UserState>(
//         listener: (context, state) {
//           if (state.status == UserStatus.error) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               getSnackBar(context, state.errorMessage!, SnackBarType.error),
//             );
//           }
//         },
//         child: BlocListener<UserFormCubit, UserFormState>(
//           listener: (context, state) {
//             if (state.status.isSubmissionSuccess) {
//               AutoRouter.of(context).pushAndPopUntil(const LoadingRoute(),
//                   predicate: ((route) => false));
//             } else if (state.status.isSubmissionFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 getSnackBar(context, state.errorMessage!, SnackBarType.error),
//               );
//             }
//           },
//           child: Scaffold(
//             resizeToAvoidBottomInset: true,
//             appBar: AppBar(),
//             body: GestureDetector(
//                 onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//                 child: const _UserDataPageBody()),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _UserDataPageBody extends StatelessWidget {
//   const _UserDataPageBody({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UserBloc, UserState>(
//       builder: (context, state) {
//         if (state.status == UserStatus.loading) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return Builder(builder: (context) {
//           return Container(
//             padding: defaultPadding,
//             child: SingleChildScrollView(
//               controller: ScrollController(),
//               child: FadeIn(
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Por favor, completa tus datos.',
//                         style: Theme.of(context).textTheme.titleLarge,
//                       ),
//                       const SizedBox(height: 16),
//                       const UserForm(),
//                       const SizedBox(height: 16),
//                       const _SaveUserData(),
//                       const SizedBox(height: 16)
//                     ]),
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }
// }

// class _SaveUserData extends StatelessWidget {
//   const _SaveUserData({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Spacer(),
//         BlocBuilder<UserFormCubit, UserFormState>(
//           builder: (context, state) {
//             return GestureDetector(
//               onTap: () async {
//                 context.read<UserFormCubit>().saveUserData();
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 width: 150,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: state.isValid
//                       ? Theme.of(context).colorScheme.primary
//                       : Theme.of(context).colorScheme.secondaryContainer,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: Text('Guardar',
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                             color: Colors.white,
//                           )),
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
