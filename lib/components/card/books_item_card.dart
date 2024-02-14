import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_books/components/container/custom_container.dart';
import 'package:favorite_books/components/text/custom_text.dart';
import 'package:favorite_books/core/constant/app/image_constant.dart';
import 'package:favorite_books/core/extension/context_extension.dart';
import 'package:favorite_books/features/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksItemCard extends StatelessWidget {
  final BookModel? model;
  final VoidCallback? onDoublePressed;
  final VoidCallback? onLongPressed;
  const BooksItemCard({super.key, this.model, this.onDoublePressed, this.onLongPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoublePressed,
      onLongPress: onLongPressed,
      child: Padding(
         padding: context.paddingLowPlusVertical,
        child: CustomContainer(
          height: 130.h,
          width: double.infinity,
          borderWidth: 1,
          borderColor: model?.isFavori != null && model!.isFavori! ? context.colors.outline : context.colors.onPrimary,
          padding: context.paddingLow,
          child: Row(
            children: [
              Flexible(child: buildFetchImage()),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCustomText(
                          context,
                          text: model?.title,
                          textControl: model?.title,
                          style: context.textThem.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Center(child: Divider(color: context.colors.onSecondary)),
                        buildCustomText(
                          context,
                          text: model?.subtitle,
                          style: context.textThem.labelSmall?.copyWith(color: context.colors.onSecondary, fontSize: 10, fontWeight: FontWeight.w500),
                          textControl: model?.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, top: 2),
                          child: buildCustomText(context,
                              textList: model?.authors,
                              text: "Authors: ${model?.authors?.join(", ")}",
                              style: context.textThem.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        buildCustomText(context,
                            text: "Publisher: ${model?.publisher}", textControl: model?.publisher, style: context.textThem.labelSmall)
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: buildCustomText(
                            context,
                            text: "published at: ${model?.publishedDate}",
                            textControl: model?.publishedDate,
                            style: context.textThem.labelSmall?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        model?.pageCount != null && model!.pageCount! > 0
                            ? CustomText(
                                text: "pages: ${model?.pageCount}",
                                style: context.textThem.labelSmall?.copyWith(fontWeight: FontWeight.w500),
                              )
                            : const SizedBox(),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFetchImage() {
    return SizedBox(
      width: 100,
      child: model?.imageLinks?.thumbnail != null
          ? CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: model!.imageLinks!.thumbnail!,
              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => Image.asset(ImageConstant.instance.noImage),
            )
          : CustomContainer(
              image: AssetImage(ImageConstant.instance.noImage),
              fit: BoxFit.cover,
            ),
    );
  }

  Widget buildCustomText(BuildContext context,
      {String? text, String? textControl, TextStyle? style, int? maxLines, TextOverflow? overflow, List<String>? textList}) {
    return textControl != null || (textList != null && textList.isNotEmpty)
        ? CustomText(
            text: text ?? "Bilinmiyor",
            style: style ?? context.textThem.labelSmall?.copyWith(fontWeight: FontWeight.bold),
            overflow: overflow,
            maxLines: maxLines,
          )
        : const SizedBox();
  }
}
