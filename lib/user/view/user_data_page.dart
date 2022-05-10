import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/user/cubit/user_form_cubit.dart';
import 'package:meddly/user/view/user_data_form.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserFormCubit(),
      child: Scaffold(
        body: Container(
          padding: defaultPadding,
          child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    kBottomNavigationBarHeight,
                child: Column(children: [
                  Text(
                    'Por favor, completa tus datos personales',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  const UserDataForm(),
                  const SizedBox(height: 20),
                  const Spacer(),
                  const _OmitOrSave()
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OmitOrSave extends StatelessWidget {
  const _OmitOrSave({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text('Omitir', style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
        const Spacer(),
        BlocBuilder<UserFormCubit, UserFormState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  color: state.isValid
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Guardar',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          )),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
