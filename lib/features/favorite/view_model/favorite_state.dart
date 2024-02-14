import 'package:equatable/equatable.dart';
import 'package:favorite_books/features/home/model/home_model.dart';

class FavoriteState extends Equatable {
  final List<BookModel> dbListModel;
  final bool loading;

  const FavoriteState({required this.dbListModel, this.loading = false});
  @override
  List<Object?> get props => [dbListModel,loading];

  FavoriteState copyWith({List<BookModel>? dbListModel,bool? loading}) {
    return FavoriteState(dbListModel: dbListModel ?? this.dbListModel,loading: loading?? this.loading);
  }
}
