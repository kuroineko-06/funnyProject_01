import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:demo_app_1/data/categoris.dart';
import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:demo_app_1/featured/pages/account.dart';
import 'package:demo_app_1/featured/pages/notification.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';
import 'package:get/get.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoriesCourse _categoriesCourse;
  HomeBloc(this._categoriesCourse) : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNotificationButtonClickEvent>(homeNotificationButtonClickEvent);
    on<HomeAccountButtonClickEvent>(homeAccountButtonClickEvent);
    on<HomeSearchButtonClickEvent>(homeSearchButtonClickEvent);
    on<HomeNavigateToNotificationEvent>(homeNavigateToNotificationEvent);
    on<HomeNavigateToAccountEvent>(homeNavigateToAccountEvent);
    on<HomeNavigateToSearchEvent>(homeNavigateToSearchEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    try {
      final data = await _categoriesCourse.fetchData();
      emit(HomeLoadedSuccessState(data));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  FutureOr<void> homeNotificationButtonClickEvent(
      HomeNotificationButtonClickEvent event, Emitter<HomeState> emit) {
    print('Notification click!');
  }

  FutureOr<void> homeAccountButtonClickEvent(
      HomeAccountButtonClickEvent event, Emitter<HomeState> emit) {
    print('Account click!');
  }

  FutureOr<void> homeNavigateToNotificationEvent(
      HomeNavigateToNotificationEvent event, Emitter<HomeState> emit) {
    print('Notification navigate!');
    Get.to(() => Notification());
  }

  FutureOr<void> homeNavigateToAccountEvent(
      HomeNavigateToAccountEvent event, Emitter<HomeState> emit) {
    print('Account navigate!');
    Get.to(() => Account());
  }

  FutureOr<void> homeNavigateToSearchEvent(
      HomeNavigateToSearchEvent event, Emitter<HomeState> emit) {
    print('Search Navigate!');
  }

  FutureOr<void> homeSearchButtonClickEvent(
      HomeSearchButtonClickEvent event, Emitter<HomeState> emit) {
    print('Search Click!');
  }
}
