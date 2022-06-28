part of 'setup_cubit.dart';

enum SetupStatus { initial, loading, success, error, saving }

@freezed
class SetupState with _$SetupState {
  const factory SetupState({
    @Default(0) int index,
    @Default(FormzStatus.pure) FormzStatus status,
    String? errorMessage,
    @Default(SetupStatus.initial) SetupStatus setupStatus,
    @Default(User.empty) User currentUser,
    Sex? sex,
    @Default(Weight.pure()) Weight weight,
    @Default(Heigth.pure()) Heigth height,
    @Default(AssetsProvider.defaultAvatar) String avatar,
  }) = _SetupState;
}
