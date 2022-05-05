// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class LoadingPage extends StatelessWidget {
//   const LoadingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<UserBloc>(context).getUser();

//     return BlocBuilder<UserBloc, UserState>(
//       builder: (context, state) {
//         return Scaffold(
//           body: BlocConsumer<UserBloc, UserState>(
//             listener: (context, state) {
//               if (state.status.isSuccess) {
//                 context.router.replace(const MainRoute());
//               }
//             },
//             builder: (context, state) {
//               return StatusBuilder(
//                 onLoading: () =>
//                     const Center(child: CircularProgressIndicator()),
//                 onError: () => Center(child: Text('Error: ${state.message}')),
//                 onSuccess: () => const SizedBox(),
//                 status: state.status,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
