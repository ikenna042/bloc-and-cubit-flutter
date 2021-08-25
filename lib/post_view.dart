import 'package:bloc_and_cubit/post.dart';
import 'package:bloc_and_cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(builder: (context, posts) {
        if (posts.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(posts[index].title),
            ),
          );
        });
      }),
    );
  }
}
