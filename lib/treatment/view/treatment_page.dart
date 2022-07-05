import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/widgets/snackbar.dart';
import 'package:treatment_repository/treatment_repository.dart';

import '../../helpers/assets_provider.dart';
import '../../helpers/constants.dart';
import '../cubit/treatment_cubit.dart';

class TreatmentPage extends StatelessWidget {
  const TreatmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TreatmentCubit(
          treatmentRepository:
              RepositoryProvider.of<TreatmentRepository>(context)),
      child: Builder(builder: (context) {
        return BlocListener<TreatmentCubit, TreatmentState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: () => ScaffoldMessenger.of(context).showSnackBar(
                getSnackBar(context, 'cargando', SnackBarType.loading),
              ),
              loaded: (treatments) =>
                  ScaffoldMessenger.of(context).showSnackBar(
                getSnackBar(
                  context,
                  '${treatments.length} tratamientos cargados',
                  SnackBarType.success,
                ),
              ),
              added: (_) => ScaffoldMessenger.of(context).showSnackBar(
                getSnackBar(context, 'listo', SnackBarType.loading),
              ),
              error: (message) => ScaffoldMessenger.of(context).showSnackBar(
                getSnackBar(context, message!, SnackBarType.error),
              ),
            );
          },
          child: Scaffold(
            body: SafeArea(
              child: Container(
                padding: defaultPadding,
                child: Center(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<TreatmentCubit>()
                                .addTreatment(treatment);
                          },
                          child: const Text('add')),
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<TreatmentCubit>()
                                .deleteTreatment(treatment);
                          },
                          child: const Text('delete')),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<TreatmentCubit>()
                              .updateTreatment(treatment);
                        },
                        child: const Text('update'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<TreatmentCubit>().getTreatments();
                        },
                        child: const Text('get'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<TreatmentCubit>()
                              .addConsumption(treatment, DateTime.now());
                        },
                        child: const Text('add consumption'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<TreatmentCubit>().deleletConsumption();
                        },
                        child: const Text('delete consumption'),
                      ),

                      // SvgPicture.asset(
                      //   AssetsProvider.medicineVector,
                      //   width: MediaQuery.of(context).size.width,
                      // ),
                      // const _NewMedicineButton(),
                      // const SizedBox(height: 16),
                      // Text('Medicamentos activos',
                      //     style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _NewMedicineButton extends StatelessWidget {
  const _NewMedicineButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nuevo medicamento',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                AutoSizeText(
                  'Agrega un nuevo medicamento para comenzar con su seguimiento.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.4)),
                ),
              ],
            ),
          ),
          SvgPicture.asset(AssetsProvider.chevron, height: 20),
        ],
      ),
    );
  }
}
