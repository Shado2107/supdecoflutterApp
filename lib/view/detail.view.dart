import 'dart:html';
import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:projet_flutter/main.dart';
import 'package:projet_flutter/view/acceuil.view.dart';


class Details extends StatelessWidget {
  //const Details({Key? key}) : super(key: key);

  dynamic articleData;
  String? description;
  Details( {this.articleData, this.description });
  TextEditingController typeController = TextEditingController ();
  TextEditingController descriptionController = TextEditingController ();
  TextEditingController idController = TextEditingController ();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    print(articleData);
    typeController.text = articleData["type"].toString();
    descriptionController.text = articleData["description"].toString();
    idController.text = articleData["id"].toString();

    return Scaffold(

      appBar: AppBar(
        title: Text("Detail"),
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>
                  Acceuil() ) );
        }, icon: const Icon(Icons.arrow_back),
        ),
      ),


    );
  }
}
