import 'dart:convert';
import 'dart:math';
import 'package:bloc_task/model/search_model.dart';
import 'package:bloc_task/reopsitory/api_repository.dart';
import 'package:bloc_task/utility/local_notification_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiRepository _apiRepository;

  SearchBloc(this._apiRepository) : super(SearchInitial()) {
    on<GetSearchList>((event, emit) async {
      try {
        emit(SearchLoading());
        final mList = await _apiRepository.fetchSearchListFromLocal();
        emit(SearchLoaded(mList));
        print("GetSearchList Mlist LENGTH--> ${mList.items!.length}");
        if (mList.error != null) {
          emit(SearchError(mList.error));
        }
      } on NetworkError {
        emit(const SearchError("Failed to fetch data. is your device online?"));
      }
    });

    on<GetRefreshList>((event, emit) async {
      try {
        emit(SearchLoading());
        final mList = await _apiRepository.fetchSearchListFromLocal();
        print("GetRefreshList Mlist LENGTH--> ${mList.items!.length}");
        emit(SearchLoaded(mList.copyWith(incompleteResults: false)));
        if (event.showNotification) {
          await NotificationService().showNotification(
              'Data updated!!', 'Your data has been updated successfully!!');
        }
        if (mList.error != null) {
          emit(SearchError(mList.error));
        }
      } on NetworkError {
        emit(const SearchError("Failed to fetch data. is your device online?"));
      }
    });

    on<AddResponseInSearch>((event, emit) async {
      try {
        emit(SearchLoading());
        final String jsonResponse =
            await rootBundle.loadString('assest/sample_search.json');
        final response = Item.fromJson(jsonDecode(jsonResponse))
            .copyWith(
              id: Random().nextInt(9999999),
              name: event.name,
              fullName: event.fullName,
              nodeId: event.nodeId,
            )
            .toJson();
        await _apiRepository.addResponseInTheLocal(response: response);
        final mList = await _apiRepository.fetchSearchListFromLocal();
        print("AddResponseInSearch Mlist LENGTH--> ${mList.items!.length}");
        await NotificationService().showNotification(
            'Submit resopnse!!', 'Your data has been added successfully!!');
        await Future.delayed(const Duration(milliseconds: 500));
        emit(SearchLoaded(mList));
        if (mList.error != null) {
          emit(SearchError(mList.error));
        }
      } on NetworkError {
        emit(const SearchError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
