import 'package:favorite_books/components/card/books_item_card.dart';
import 'package:favorite_books/core/base/view/base_view.dart';
import 'package:favorite_books/core/extension/context_extension.dart';
import 'package:favorite_books/features/favorite/view_model/favorite_state.dart';
import 'package:favorite_books/features/favorite/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
          title: Text("Favoriler", style: context.textThem.titleLarge),
        ),
        body: Padding(
          padding: context.paddingLowPlusHorizontal,
          child: BaseView<FavoriteViewModel, FavoriteState>(
            onModelReady: (viewModel) async {
              await viewModel.getAllBooks();
            },
            onPageBuilder: (context, viewModel, state) {
              return Column(
                children: [
                  state.dbListModel.isEmpty
                      ? const Expanded(child: Center(child: Text("Henüz kayıt yapmadınız ")))
                      : Expanded(
                          child: state.loading
                              ? Center(child: CircularProgressIndicator(color: context.colors.secondary))
                              : ListView.builder(
                                  itemCount: state.dbListModel.length,
                                  itemBuilder: (context, index) {
                                    final model = state.dbListModel[index];
                                    return BooksItemCard(model: model, onLongPressed: () => viewModel.deleteItem(model.id ?? 0));
                                  },
                                ),
                        ),
                ],
              );
            },
          ),
        ));
  }
}
