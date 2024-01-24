import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app_1/data/categoris.dart';
import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'see_more_event.dart';
part 'see_more_state.dart';

class SeeMoreBloc extends Bloc<SeeMoreEvent, SeeMoreState> {
  final CategoriesCourse _categoriesCourse;
  SeeMoreBloc(this._categoriesCourse) : super(SeeMoreInitial()) {
    on<SeeMoreInitialEvent>(seeMoreInitialEvent);
  }

  FutureOr<void> seeMoreInitialEvent(
      SeeMoreInitialEvent event, Emitter<SeeMoreState> emit) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final data = await _categoriesCourse.fetchData();
      emit(SeeMoreSuccessState(data));
    } catch (e) {}
  }
}
