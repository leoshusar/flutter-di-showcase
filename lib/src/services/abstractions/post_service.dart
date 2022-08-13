import '../../models/post.dart';

abstract class PostService {
  Future<List<Post>> getPosts();
  Future<Post> getPost(int id);
}
