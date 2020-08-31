import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:yt_bloc/blocs/videos_bloc.dart';
import 'package:yt_bloc/data/data_search.dart';
import 'package:yt_bloc/widgets/video_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Icon(Icons.play_circle_outline, color: Colors.red,),
        ),
        backgroundColor: Colors.black87,
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text("0", style: TextStyle(
              fontSize: 20
            ),),
          ),
          IconButton(
              icon: Icon(Icons.star),
              onPressed: (){}
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: ()async{
                String result = await showSearch(
                    context: context, delegate: DataSearch());
                if(result != null)
                  BlocProvider.of<VideosBloc>(context)
                      .inSearch.add(result);
              }
          )
        ],
      ),
      body: StreamBuilder(
          stream: BlocProvider.of<VideosBloc>
            (context).outVideos,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemBuilder: (context, index){
                    return VideoTile (snapshot.data[index]);
                  },
                itemCount: snapshot.data.length,
              );
            }else{
              return Container();
            }
          }
      ),
    );
  }
}
