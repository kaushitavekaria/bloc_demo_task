import 'package:bloc_task/model/search_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<SearchModel> fetchSearchList() {
    return _provider.fetchSearchList();
  }

  Future<SearchModel> fetchSearchListFromLocal() {
    return _provider.fetchSearchListFromLocal();
  }

  Future<void> addResponseInTheLocal({required Map<String, dynamic> response }) {
    return _provider.addResponseInTheLocal(response: response);
  }
}

class NetworkError extends Error {}