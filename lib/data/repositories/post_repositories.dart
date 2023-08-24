import 'package:bloc_api/data/models/post_model.dart';
import 'package:bloc_api/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepositories {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/photos");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
