import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/treatment/cubit/treatment_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:treatment_repository/treatment_repository.dart';

class MockTreatmentRepository extends Mock implements TreatmentRepository {}

void main() {
  group('TreatmentCubit', () {
    const errorMessage = 'ops!';
    final dateTime = DateTime(2022, 1, 1);
    const treatmentId = '9ed9de58-c36c-44e6-b03b-062ce204815f';
    final TreatmentRepository treatmentRepository = MockTreatmentRepository();
    final Treatment treatment = Treatment(
      id: '9ed9de58-c36c-44e6-b03b-062ce204815f',
      name: 'nombre tratamiento',
      medicine: const Medicine(
        icon: 'google.com/icon',
        name: 'Paracetamol',
        method: Method.medicineDosis(name: 'Pastilla', value: 10, unit: 'g'),
      ),
      stockWarning: 5,
      stock: 10,
      treatmentIndication: TreatmentIndication(
          instructions: 'Tomarlo cada 8 horas',
          consumptionRule: ConsumptionRule.specificDays(
              start: DateTime.now(),
              end: DateTime(2023),
              days: ['monday', 'tuesday', 'wednesday', 'sunday']),
          start: DateTime.now(),
          end: DateTime.now()),
    );

    group('init', () {
      test('initial state is TreatmentState.initial', () {
        expect(TreatmentCubit(treatmentRepository: treatmentRepository).state,
            const TreatmentState.initial());
      });
    });

    group('add', () {
      blocTest<TreatmentCubit, TreatmentState>(
        'add successful emits [TreatmentState.added]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () {
          when(() => treatmentRepository.addTreatment(treatment))
              .thenAnswer((_) async => Right(treatment));
        },
        act: (cubit) => cubit.addTreatment(treatment),
        expect: () => [
          const TreatmentState.loading(),
          TreatmentState.added(treatment),
        ],
      );

      blocTest<TreatmentCubit, TreatmentState>(
        'add failed emits [TreatmentState.error]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () {
          when(() => treatmentRepository.addTreatment(treatment)).thenAnswer(
              (_) async => Left(TreatmentException(message: errorMessage)));
        },
        act: (cubit) => cubit.addTreatment(treatment),
        expect: () => [
          const TreatmentState.loading(),
          const TreatmentState.error(errorMessage),
        ],
      );
    });

    group('get', () {
      blocTest<TreatmentCubit, TreatmentState>(
        'get successful emits [TreatmentState.loaded]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () {
          when(() => treatmentRepository.getTreatments())
              .thenAnswer((_) async => Right([treatment]));
        },
        act: (cubit) => cubit.getTreatments(),
        expect: () => [
          const TreatmentState.loading(),
          TreatmentState.loaded([treatment]),
        ],
      );

      blocTest<TreatmentCubit, TreatmentState>(
        'get failed emits [TreatmentState.error]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () {
          when(() => treatmentRepository.getTreatments()).thenAnswer(
              (_) async => Left(TreatmentException(message: errorMessage)));
        },
        act: (cubit) => cubit.getTreatments(),
        expect: () => [
          const TreatmentState.loading(),
          const TreatmentState.error(errorMessage),
        ],
      );

      blocTest<TreatmentCubit, TreatmentState>(
        'get successful and empty emits [TreatmentState.loaded]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () => when(() => treatmentRepository.getTreatments())
            .thenAnswer((_) async => const Right([])),
        act: (cubit) => cubit.getTreatments(),
        expect: () => [
          const TreatmentState.loading(),
          const TreatmentState.loaded([]),
        ],
      );
    });

    // TODO:
    group('delete', () {
      blocTest<TreatmentCubit, TreatmentState>(
        'delete successful emits [TreatmentState.deleted]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () => when(() => treatmentRepository.deleteTreatment(treatment))
            .thenAnswer((_) async => Right(Nothing())),
        act: (cubit) => cubit.deleteTreatment(treatment),
        expect: () => [
          const TreatmentState.loading(),
          const TreatmentState.deleted(),
        ],
      );

      blocTest<TreatmentCubit, TreatmentState>(
        'delete failed emits [TreatmentState.error]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () => when(() => treatmentRepository.deleteTreatment(treatment))
            .thenAnswer(
                (_) async => Left(TreatmentException(message: errorMessage))),
        act: (cubit) => cubit.deleteTreatment(treatment),
        expect: () => [
          const TreatmentState.loading(),
          const TreatmentState.error(errorMessage),
        ],
      );
    });

    group('add consumption', () {
      blocTest<TreatmentCubit, TreatmentState>(
        'add comsumption successful emits [Treatment.consumptionAdded]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () => when(
                () => treatmentRepository.addConsumption(treatmentId, dateTime))
            .thenAnswer((_) async => Right(Nothing())),
        act: (cubit) => cubit.addConsumption(treatmentId, dateTime),
        expect: () => [
          const TreatmentState.loading(),
          const TreatmentState.consumptionAdded(),
        ],
      );

      blocTest<TreatmentCubit, TreatmentState>(
        'add comsumption failed emits [Treatment.error]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () => when(
                () => treatmentRepository.addConsumption(treatmentId, dateTime))
            .thenAnswer(
                (_) async => Left(TreatmentException(message: errorMessage))),
        act: (cubit) => cubit.addConsumption(treatmentId, dateTime),
        expect: () => [
          const TreatmentState.loading(),
          const TreatmentState.error(errorMessage),
        ],
      );
    });

    group('delete consumption', () {
      blocTest<TreatmentCubit, TreatmentState>(
        'delete comsumption successful emits [Treatment.consumptionDeleted]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () => when(() =>
                treatmentRepository.deleteConsumption(treatmentId, dateTime))
            .thenAnswer((_) async => Right(Nothing())),
        act: (cubit) => cubit.deleteConsumption(treatmentId, dateTime),
        expect: () => [
          const TreatmentState.loading(),
          const TreatmentState.consumptionDeleted(),
        ],
      );

      blocTest<TreatmentCubit, TreatmentState>(
        'delete comsumption failed emits [Treatment.error]',
        build: () => TreatmentCubit(treatmentRepository: treatmentRepository),
        setUp: () => when(() =>
                treatmentRepository.deleteConsumption(treatmentId, dateTime))
            .thenAnswer(
                (_) async => Left(TreatmentException(message: errorMessage))),
        act: (cubit) => cubit.deleteConsumption(treatmentId, dateTime),
        expect: () => [
          const TreatmentState.loading(),
          const TreatmentState.error(errorMessage),
        ],
      );
    });
  });
}
