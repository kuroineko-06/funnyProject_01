import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app_1/data/categoris.dart';
import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final CategoriesCourse _categoriesCourse;
  SearchBloc(this._categoriesCourse) : super(SearchInitial()) {
    on<SearchInitialEvent>(searchInitialEvent);
  }

  FutureOr<void> searchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final data = await _categoriesCourse.fetchData();
      emit(SearchSuccessState(data));
    } catch (e) {}
  }
}
