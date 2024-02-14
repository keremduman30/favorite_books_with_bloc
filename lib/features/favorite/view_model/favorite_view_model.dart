import 'package:favorite_books/components/getx/locale_getx_snackbar.dart';
import 'package:favorite_books/core/init/db/database_helper.dart';
import 'package:favorite_books/features/favorite/view_model/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewModel extends Cubit<FavoriteState> {
  final db = DatabaseHelper.instance;

  FavoriteViewModel() : super(const FavoriteState(dbListModel: []));

  Future<void> getAllBooks() async {
    emit(state.copyWith(loading: true));
    final list = await db.getAllBooks();
    if (list.isNotEmpty) {
      emit(state.copyWith(dbListModel: list));
    }
    emit(state.copyWith(loading: false));
  }

  void deleteItem(int modelId) async {
    final res = await db.deleteBook(modelId);
    if (res) {
      emit(state.copyWith(loading: true));
      final list = await db.getAllBooks();
      emit(state.copyWith(dbListModel: list));
      emit(state.copyWith(loading: false));
    } else {
      LocalGetxSnackBar.instance.localeGetSnackBar(message: "Silme Basarısız", successful: false);
    }
  }
}
