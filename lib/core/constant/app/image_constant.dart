class ImageConstant {
  static ImageConstant? _instace;
  static ImageConstant get instance {
    _instace ??= ImageConstant._init();
    return _instace!;
  }

  ImageConstant._init();
  final noImage = "no_image".toPng;
  final book = "book".toPng;
}

extension _ImagePathExtension on String {
  String get toPng => "assets/image/png/$this.png";
  // String get toSvg => "assets/image/svg/$this.svg";
}
