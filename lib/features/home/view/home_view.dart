import 'package:favorite_books/components/buttons/rounded_elevated_btn.dart';
import 'package:favorite_books/components/card/books_item_card.dart';
import 'package:favorite_books/components/container/custom_container.dart';
import 'package:favorite_books/components/text_field/custom_text_form_field.dart';
import 'package:favorite_books/core/base/functions.dart';
import 'package:favorite_books/core/base/view/base_view.dart';
import 'package:favorite_books/core/constant/app/image_constant.dart';
import 'package:favorite_books/core/extension/context_extension.dart';

import 'package:favorite_books/features/home/view_model/home_state.dart';
import 'package:favorite_books/features/home/view_model/home_view_model.dart';
import 'package:favorite_books/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Favori Kitaplarım", style: context.textThem.titleLarge),
            actions: [
              IconButton(
                onPressed: () => locator<HomeViewModel>().clickIconBtn(),
                icon: const Icon(Icons.favorite),
              )
            ],
          ),
          body: Padding(
              padding: context.paddingLowPlusHorizontal,
              child: BaseView<HomeViewModel, HomeState>(
                onPageBuilder: (context, viewModel, state) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomContainer(
                            padding: const EdgeInsets.only(right: 5),
                            borderWidth: 1,
                            borderColor: context.colors.secondary.withOpacity(0.7),
                            borderRadiusAll: 5,
                            height: 40.h,
                            child: CustomTextFormField(
                              controller: locator<HomeViewModel>().searchController,
                              focusNode: locator<HomeViewModel>().focusNode,
                              onChanged: (p0) => viewModel.changeText(p0.trim().toLowerCase()),
                              prefixIcon: Icon(Icons.search, color: context.colors.secondary, size: 25),
                            ),
                          ),
                        ),
                        Padding(
                          padding: context.paddingLowHorizontal,
                          child: RoundedElevatedButtonWidget(
                            width: 100.w,
                            height: 30.h,
                            radiusAll: 3,
                            backgroundColor: context.colors.onPrimary,
                            onPressed: () => viewModel.clickSearchButton(),
                            btnText: "Search",
                            textStyle: context.textThem.titleSmall,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: state.books.isEmpty
                          ? Center(
                              child: CustomContainer(width: 80.w, height: 80.h, image: AssetImage(ImageConstant.instance.book), fit: BoxFit.cover))
                          : state.loading
                              ? Center(child: CircularProgressIndicator(color: context.colors.secondary))
                              : buildListView(state, context),
                    )
                  ],
                ),
              ))),
    );
  }

  Widget buildListView(HomeState state, BuildContext context) {
    return ListView.builder(
      itemCount: state.books.length,
      itemBuilder: (context, index) {
        final model = state.books[index];
        return BooksItemCard(onDoublePressed: () => locator<HomeViewModel>().ondoublePressed(model), model: model);
      },
    );
  }
}

//#192328
