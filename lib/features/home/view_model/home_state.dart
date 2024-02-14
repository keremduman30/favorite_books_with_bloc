import 'package:equatable/equatable.dart';
import 'package:favorite_books/features/home/model/home_model.dart';

class HomeState extends Equatable {
  final bool loading;
  final List<BookModel> books;
  final String? searchText;
  const HomeState({required this.books, this.loading = false, this.searchText});
  @override
  List<Object?> get props => [loading, books, searchText];

  HomeState copyWith({bool? loading, List<BookModel>? books, String? searchText}) {
    return HomeState(books: books ?? this.books, loading: loading ?? this.loading, searchText: searchText ?? this.searchText);
  }
}
