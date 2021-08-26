import 'package:bloc_and_cubit/nav_cubit.dart';
import 'package:bloc_and_cubit/post.dart';
import 'package:bloc_and_cubit/post_details_view.dart';
import 'package:bloc_and_cubit/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post>(builder: ((context, post) {
      return Navigator(pages: [
        MaterialPage(child: PostView()),
        if (post != null) MaterialPage(child: PostDetailsView(post: post))
      ], onPopPage: (route, result) {});
    }));
  }
}
