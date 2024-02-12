class ApplicationConstant {
  static ApplicationConstant? _instace;
  static ApplicationConstant get instance {
    _instace ??= ApplicationConstant._init();
    return _instace!;
  }

  ApplicationConstant._init();

}


