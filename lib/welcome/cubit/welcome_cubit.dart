import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeState());

  late final PageController pageController;
  late final Timer _timer;

  void init() {
    pageController = PageController();

    pageController.addListener(() {
      if (pageController.page!.round() % 3 != state.currentPage) {
        emit(state.copyWith(currentPage: (pageController.page!.round()) % 3));
      }
    });

    automaticallyMoveToNextPage();
  }

  void automaticallyMoveToNextPage() async {
    _timer = Timer.periodic(const Duration(seconds: 9), (Timer timer) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  Future<void> close() {
    pageController.dispose();
    _timer.cancel();
    return super.close();
  }
}
