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
      if (pageController.page! < 0.5) {
        emit(state.copyWith(currentPage: 0));
      } else if (pageController.page! < 1.5 && pageController.page! >= 0.5) {
        emit(state.copyWith(currentPage: 1));
      } else if (pageController.page! <= 2 && pageController.page! >= 1.5) {
        emit(state.copyWith(currentPage: 2));
      }
    });

    automaticallyMoveToNextPage();
  }

  void automaticallyMoveToNextPage() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (state.currentPage == 2) {
        emit(state.copyWith(currentPage: 0));
        pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else {
        emit(state.copyWith(currentPage: state.currentPage + 1));
        pageController.animateToPage(state.currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  Future<void> close() {
    pageController.dispose();
    _timer.cancel();
    return super.close();
  }
}
