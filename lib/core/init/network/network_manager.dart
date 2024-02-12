import 'package:dio/dio.dart';


import '../../constant/app/env_keys.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  late Dio dio;
  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: EnvKeys.base_url));
    dio.options.sendTimeout = const Duration(milliseconds: 5000); //50s
    dio.options.receiveTimeout = const Duration(milliseconds: 5000);
  }

 
}
