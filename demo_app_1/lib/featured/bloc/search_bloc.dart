import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app_1/data/data.dart';
import 'package:demo_app_1/featured/models/home_data_model.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchInitialEvent>(searchInitialEvent);
  }

  FutureOr<void> searchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) {
    emit(SearchSuccessState(
        dataItems: CourseData.courseData
            .map((e) => DataModel(
                id: e['id'],
                title: e['title'],
                description: e['description'],
                instructor: e['instructor'],
                imageUrl: e['imageURL'],
                price: e['price']))
            .toList()));
  }
}
