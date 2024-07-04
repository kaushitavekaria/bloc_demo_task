// ignore_for_file: avoid_print

import 'package:bloc_task/database/dao/search_dao.dart';
import 'package:bloc_task/model/search_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final SearchDAO searchDAO = SearchDAO();
  final String _url = 'https://api.github.com/search/repositories?q=created:%3E2022-04-29&sort=stars&order=desc';

  Future<SearchModel> fetchSearchList() async {
    try {
      Response response = await _dio.get(_url);
      return SearchModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SearchModel.withError("Data not found / Connection issue");
    }
  }

  Future<SearchModel> fetchSearchListFromLocal() async {
    try {
      final response = await searchDAO.getAllItems();
      if(response.isEmpty) {
        final networkResponse  = await fetchSearchList();
        await searchDAO.insertData(itemList: networkResponse.items ?? []);
        return networkResponse;
      } else {
        return SearchModel(items: response,incompleteResults: false,totalCount: response.length);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SearchModel.withError("Data not found / Connection issue");
    }
  }

  Future<void> addResponseInTheLocal({required Map<String, dynamic> response}) async {
    try {
      await searchDAO.insertData(itemList: [Item.fromJson(response)]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}