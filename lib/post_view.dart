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
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is LoadingPostsState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedPostsState) {
          return RefreshIndicator(
              onRefresh: () async =>
                  BlocProvider.of<PostsBloc>(context).add(PullToRefreshEvent()),
              child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.posts[index].title),
                      ),
                    );
                  }));
        } else if (state is FailedToLoadPostsState) {
          return Center(child: Text('Error occured'));
        } else {
          return Container();
        }
      }),
    );
  }
}
