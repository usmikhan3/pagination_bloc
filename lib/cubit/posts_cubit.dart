import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagination_bloc/data/models/post.dart';
import 'package:pagination_bloc/data/repositories/post_repository.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.repository) : super(PostsInitial());

  int page = 1;

  final PostsRepository repository;

  void loadPosts() {
    if (state is PostsLoading) return;
    final currentState = state;

    var oldPost = <Post>[];
    if (currentState is PostsLoaded) {
      oldPost = currentState.posts;
    }
    emit(PostsLoading(oldPost, isFirstFetch: page == 1));

    repository.fetchPosts(page).then((newPosts) {
      page++;
      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);
      emit(PostsLoaded(posts));
    });
  }
}
