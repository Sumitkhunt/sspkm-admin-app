import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class photo extends StatefulWidget {
  final String? wphoto;
  final String? title;


  const photo({Key? key, this.wphoto, this.title}) : super(key: key);

  @override
  State<photo> createState() => _photoState();
}

class _photoState extends State<photo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Center(
          child: PhotoView(imageProvider: NetworkImage(
            widget.wphoto.toString(),

          ),)),
    );
  }
}
