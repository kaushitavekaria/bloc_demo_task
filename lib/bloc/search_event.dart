part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchList extends SearchEvent {}

class GetRefreshList extends SearchEvent {
  final bool showNotification;

  const GetRefreshList({required this.showNotification});
}

class AddResponseInSearch extends SearchEvent {
  final String nodeId;
  final String name;
  final String fullName;

  const AddResponseInSearch({required this.nodeId, required this.name, required this.fullName});
}