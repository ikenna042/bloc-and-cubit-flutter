import 'post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<Post?> {
  NavCubit() : super(null);

  void showPostDetails(Post post) => emit(post);

  void popToPost() => emit(null);
}
