class BookModel {
  String? title;
  String? subtitle;
  String? description;
  String? publisher;
  String? publishedDate;
  int? pageCount;
  ImageLinks? imageLinks;
  List<String>? authors;

  BookModel(
      {this.title,
      this.subtitle,
      this.description,
      this.publisher,
      this.publishedDate,
      this.pageCount,
      this.imageLinks,
      this.authors});

  BookModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    authors = json['authors'].cast<String>();
    publisher = json['publisher'];
    description = json['description'];
    publishedDate = json['publishedDate'];

    pageCount = json['pageCount'];
    imageLinks = json['imageLinks'] != null
        ? ImageLinks.fromJson(json['imageLinks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['authors'] = authors;
    data['publisher'] = publisher;
    data['description'] = description;
    data['publishedDate'] = publishedDate;

    data['pageCount'] = pageCount;

    if (imageLinks != null) {
      data['imageLinks'] = imageLinks!.toJson();
    }
    return data;
  }
}

final class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({smallThumbnail, thumbnail});

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['smallThumbnail'] = smallThumbnail;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
