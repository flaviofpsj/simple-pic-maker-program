import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
	//final data cannot be change
	final List<ImageModel> images;
	//constructor
	ImageList(this.images);
	//build widget
	Widget build(BuildContext context) {
		return new ListView.builder(
			//have the same length of images list field
			itemCount: images.length,
			//index references initiate at 0
			itemBuilder: (context, int index) {
				//return a reference
				return buildImage(images[index]);
			},
		);
	}
	//decoration widget
	Widget buildImage(ImageModel image) {
		return new Container(
			//periferic border
			decoration: new BoxDecoration(
				border: Border.all(
					color: Colors.redAccent,
					width: 3.0,
				),
				borderRadius: BorderRadius.circular(15.0),
			),
			//inside of the border
			padding: new EdgeInsets.all(20.0),
			//outside of the border
			margin: new EdgeInsets.all(20.0),
			//content inside of the border
			child: new Column(
				children: <Widget>[
					//image
					new Padding(
						//img src
						child: Image.network(image.url),
						//padding at the bottom of the image
						padding: new EdgeInsets.only(bottom: 8.0),
					),
					//text
					new Text(
						//text src
						image.title,
						//align
						textAlign: TextAlign.center,
						//style
						style: new TextStyle(
							fontSize: 11.0,
							fontWeight: FontWeight.bold,
						),
					),
				],
			),
		);
	}
}