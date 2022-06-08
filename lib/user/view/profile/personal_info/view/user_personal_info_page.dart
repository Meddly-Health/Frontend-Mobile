import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../blocs.dart';
import '../../../../../helpers/assets_provider.dart';
import '../../../../../helpers/constants.dart';
import 'package:user_repository/user_repository.dart';
import '../../../../../widgets/widgets.dart';

class UserPersonalInfoPage extends StatefulWidget {
  const UserPersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<UserPersonalInfoPage> createState() => _UserPersonalInfoPageState();
}

class _UserPersonalInfoPageState extends State<UserPersonalInfoPage> {
  late final User? currentUser;
  @override
  void initState() {
    currentUser = context.read<UserBloc>().state.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FadeIn(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          padding: defaultPadding.copyWith(bottom: 0, top: 0),
          child: SingleChildScrollView(
            child: BlocListener<UserBloc, UserState>(
              listener: ((context, state) {
                if (state.status == UserStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
                      context,
                      'Error al modificar el perfil.',
                      SnackBarType.error));
                }
                if (state.status == UserStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    getSnackBar(context, 'Perfil guardado correctamente.',
                        SnackBarType.success),
                  );
                }
              }),
              child: Builder(builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const PageTitle(
                      title: 'Mi perfil',
                    ),
                    const SizedBox(height: 35),
                    const _UserAvatar(),
                    const SizedBox(height: 16),
                    // const _PersonalInfoAndEdit(),
                    const SizedBox(height: 16),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state.status == UserStatus.loading) {
                          return const Center(
                              child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Loading(),
                          ));
                        }

                        if (state.status == UserStatus.error) {
                          return Center(
                            child: SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: const NoData(
                                message:
                                    'Error al cargar la información del usuario.',
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    ));
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Avatar(radius: 50),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 14,
                  width: 14,
                  child: SvgPicture.asset(
                    AssetsProvider.refresh,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  )),
              const SizedBox(width: 10),
              Text(
                'Cambiar avatar',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
