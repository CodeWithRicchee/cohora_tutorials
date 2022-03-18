import 'package:cohora_introscreen/models/tutorials.dart';
import 'package:dio/dio.dart';

class TutorialsAPI {
  String url = 'https://apidev.cohora.net/tutorial/v1/tutorials';
  Dio? _dio;

  TutorialsAPI() {
    _dio = Dio();
  }

  Future<List<Tutorials>?> fetchtutorials() async {
    try {
      Response response = await _dio!.get(url);

      return (response.data as List).map((e) => Tutorials.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e.message);
    }
    return null;
  }
}
