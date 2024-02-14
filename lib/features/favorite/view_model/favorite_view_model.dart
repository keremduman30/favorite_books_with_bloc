import 'package:favorite_books/core/init/db/database_helper.dart';
import 'package:favorite_books/features/favorite/view_model/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewModel extends Cubit<FavoriteState> {
  final db = DatabaseHelper.instance;

  FavoriteViewModel(super.initialState);

  Future<void> getAllBooks() async {
    emit(state.copyWith(loading: true));
    final list = await db.getAllBooks();
    if (list.isNotEmpty) {
      emit(state.copyWith(dbListModel: list));
    }
    emit(state.copyWith(loading: true));
  }
}
