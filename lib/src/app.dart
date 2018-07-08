import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

//Stateful widget
class App extends StatefulWidget {
	AppState createState() =>  AppState();
}

//Stateful widget state (converted from Stateless widget)
class AppState extends State<App> {
	int counter = 0;
	List<ImageModel> images = [];

	void fetchImage() async {
		counter++;
		//get function request
		var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
		//instance from ImageModel.fromJson constructor
		var imageModel = ImageModel.fromJson(json.decode(response.body));
		//method to add a new instance everytime i call the fetchImage method
		setState(() {
			images.add(imageModel);
		});
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: ImageList(images),
				floatingActionButton: FloatingActionButton(
					//call fetchImage method function
					onPressed: fetchImage,
					child: Icon(Icons.add),
				),
				appBar: AppBar(
					title: Text('Lets see some images!'),
				),
			),
		);
	}
}

//Stateless widget
/*class App extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				floatingActionButton: FloatingActionButton(
					onPressed: () {
						print('Button has pressed!');
					},
					child: Icon(Icons.add),
				),
				appBar: AppBar(
					title: Text('Lets see some images!'),
				),
			),
		);
	}
}*/