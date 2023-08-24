import 'package:bloc_api/data/models/post_model.dart';
import 'package:bloc_api/data/repositories/post_repositories.dart';
import 'package:bloc_api/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  PostRepositories postRepositories = PostRepositories();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepositories.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
