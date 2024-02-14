class BookModel {
  String? title;
  String? subtitle;
  String? description;
  String? publisher;
  String? publishedDate;
  int? pageCount;
  ImageLinks? imageLinks;
  List<String>? authors;
  bool? isFavori;

  BookModel(
      {this.title,
      this.subtitle,
      this.description,
      this.publisher,
      this.publishedDate,
      this.pageCount,
      this.imageLinks,
      this.authors,
      this.isFavori = false});

  BookModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    authors = List<String>.from(json['authors'] ?? []);
    publisher = json['publisher'];
    description = json['description'];
    publishedDate = json['publishedDate'];
    pageCount = json['pageCount'];
    imageLinks = json['imageLinks'] != null ? ImageLinks.fromJson(json['imageLinks']) : null;
  }
  BookModel.fromJsonToDb(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    authors = json['authors'].split(',');
    publisher = json['publisher'];
    description = json['description'];
    publishedDate = json['publishedDate'];
    pageCount = json['pageCount'];
    isFavori = true;
    imageLinks = ImageLinks.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['authors'] = authors?.join(","); //because sqflite doesnt accept List<String>
    data['publisher'] = publisher;
    data['publishedDate'] = publishedDate;
    data['pageCount'] = pageCount;
    if (imageLinks?.thumbnail != null) {
      data['thumbnail'] = imageLinks!.thumbnail;
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
