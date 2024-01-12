import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:demo_app_1/data/data.dart';
import 'package:demo_app_1/featured/models/home_data_model.dart';
import 'package:demo_app_1/featured/pages/account.dart';
import 'package:demo_app_1/featured/pages/notification.dart';

import 'package:meta/meta.dart';
import 'package:get/get.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
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
    emit(HomeLoadedSuccessState(
        data: CourseData.courseData
            .map((e) => DataModel(
                id: e['id'],
                title: e['title'],
                description: e['description'],
                instructor: e['instructor'],
                imageUrl: e['imageURL'],
                price: e['price']))
            .toList()));
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
