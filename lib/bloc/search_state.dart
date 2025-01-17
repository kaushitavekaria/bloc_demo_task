// ignore_for_file: override_on_non_overriding_member

part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  @override
  final SearchModel searchModel;
  const SearchLoaded(this.searchModel);
}

class SearchError extends SearchState {
  final String? message;
  const SearchError(this.message);
}
