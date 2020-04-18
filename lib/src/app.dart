//Import Flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import './models/image_model.dart';
import 'dart:convert';
import 'widgets/images_list.dart';

//Create a class that will be our custom widget

//this class must extend the 'StatlessWidget' base Class
class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
//Must define a 'build' Method that returns the widgets that
//*this* widget will show
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter += 1; //can aslo be written counter++
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lets See Images!'),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            fetchImage();
          },
        ),
      ),
    );
  }
}
