import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:yt_bloc/api.dart';
import 'package:yt_bloc/models/videos_model.dart';

class VideosBloc implements BlocBase {

  Api api;
  List<Video> videos;

  final _videosCtrl = StreamController<List<Video>>();
  Stream get outVideos => _videosCtrl.stream;

  final _searchCtrl = StreamController<String>();
  Sink get inSearch => _searchCtrl.sink;

  VideosBloc(){
    api = Api();

    _searchCtrl.stream.listen(_search);

  }
  void _search(String search) async {
    videos = await api.search(search);
  }

  @override
  void dispose() {
    _videosCtrl.close();
    _searchCtrl.close();
  }

}