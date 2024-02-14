import 'package:favorite_books/components/getx/locale_getx_snackbar.dart';
import 'package:favorite_books/core/init/db/database_helper.dart';
import 'package:favorite_books/core/init/navigation/navigation_constant.dart';
import 'package:favorite_books/core/init/navigation/navigation_service.dart';
import 'package:favorite_books/features/home/model/home_model.dart';
import 'package:favorite_books/features/home/service/home_service.dart';
import 'package:favorite_books/features/home/view_model/home_state.dart';
import 'package:favorite_books/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeState> {
  late final TextEditingController searchController;
  final db = DatabaseHelper.instance;
  FocusNode? focusNode;

  HomeViewModel() : super(const HomeState(books: [])) {
    searchController = TextEditingController();
    focusNode = FocusNode();
  }
  Future getBooks() async {
    emit(state.copyWith(loading: true));
    final bookList = await locator<HomeService>().getSearchBooks(state.searchText!);
    if (bookList != null && bookList.isNotEmpty) {
      emit(state.copyWith(loading: false, books: bookList));
    }
  }

  void changeText(String text) {
    emit(state.copyWith(searchText: text));
    if (state.searchText?.isEmpty ?? false) {
      emit(state.copyWith(books: []));
    }
  }

  void ondoublePressed(BookModel model) async {
    final list = await db.getAllBooks();
    final isAny = list.any((element) => element.title == model.title);
    if (!isAny) {
      int resonse = await db.addToBook(model);
      if (resonse > 0) {
        LocalGetxSnackBar.instance.localeGetSnackBar(message: "başarıyla kaydedildi", successful: true);
      }
    } else {
      LocalGetxSnackBar.instance.localeGetSnackBar(message: "bunu zaten kaydettiniz", successful: false);
    }
  }

  void clickSearchButton() async {
    if (state.searchText?.isNotEmpty ?? false) {
      if (state.searchText!.length < 500) {
        emit(state.copyWith(loading: true));
        await getBooks();
      } else {
        LocalGetxSnackBar.instance.localeGetSnackBar(successful: false, message: "Geçersiz terim");
      }
    }
    emit(state.copyWith(loading: false));
  }

  void clickIconBtn() {
    NavigationService.instance.navigatorToPage(path: NavigationConstant.favorite);
    emit(state.copyWith(books: [], searchText: ""));
    searchController.clear();
    focusNode?.unfocus();
  }
}
