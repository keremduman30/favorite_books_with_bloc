import 'dart:convert';

import 'package:favorite_books/core/init/network/end_point.dart';
import 'package:favorite_books/core/init/network/network_manager.dart';
import 'package:favorite_books/features/home/model/home_model.dart';

class HomeService {
  final dio = NetworkManager.instance.dio;

  Future<List<BookModel>?> getSearchBooks(String searchWord) async {
    try {
      final response = await dio.get("${EndPoint.GET_BOOKS}?q=$searchWord");

      if (response.statusCode == 200) {
        final Iterable jsonList = response.data is String
            ? jsonDecode(response.data["items"])
            : response.data["items"];

        if (jsonList is List) {
          final volumeJsonList = jsonList
              .map((data) => BookModel.fromJson(data["volumeInfo"]))
              .toList();
          return volumeJsonList;
        }
      }
      return [];
    } catch (e) {
      return null;
    }
  }
}
