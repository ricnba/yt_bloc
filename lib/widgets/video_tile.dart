import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yt_bloc/models/videos_model.dart';

class VideoTile extends StatelessWidget {

  final Video video;
  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
              aspectRatio: 16.0/9.0,
              child: Container(color: Colors.red,)//Image.network(video.thumb, fit: BoxFit.cover,),
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                            video.title
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                            video.channel
                        ),
                      )
                      
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}


