part of 'welcome_cubit.dart';

@immutable
class WelcomeState {
  final int currentPage;

  const WelcomeState({
    this.currentPage = 0,
  });

  WelcomeState copyWith({
    int? currentPage,
    PageController? pageController,
  }) {
    return WelcomeState(
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
