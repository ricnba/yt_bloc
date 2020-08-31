import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:yt_bloc/screens/home_screen.dart';

import 'blocs/videos_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: VideosBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        )
    );
  }
}
