import 'package:pagination_bloc/data/models/post.dart';
import 'package:pagination_bloc/data/services/post_services.dart';

class PostsRepository {
  final PostService service;

  PostsRepository(this.service);
  Future<List<Post>> fetchPosts(int page) async {
    final posts = await service.fetchPosts(page);
    return posts.map((e) => Post.fromJson(e)).toList();
  }
}
