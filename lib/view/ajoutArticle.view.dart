import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projet_flutter/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet_flutter/view/acceuil.view.dart';

class AjoutArticle extends StatelessWidget{
  final formKey = GlobalKey<FormState>();
  TextEditingController typeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dateFinController =  TextEditingController();

  dynamic article = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout d'Article"),
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Acceuil())
          );
        }, icon: const Icon(Icons.arrow_back),)
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0, right: 16.0, bottom: 8.0
              ),
              child: TextFormField(
                controller: typeController,
                decoration: InputDecoration(
                  labelText: 'Type',

                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'champ obligatoire';
                  }
                  return null;
                },
              )
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0, left: 16.0, right:16.0, bottom: 8.0
              ),
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',

                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'champ obligatoire';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                    labelText: 'Prenom',
                    ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Champs obligatoire';
                  }
                  return null;
                },
              ),
            ),

            SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                onPressed: () {

                  if (formKey.currentState!.validate()) {

                    ajoutArticle(typeController.text, descriptionController.text,
                        idController.text).then((value) {
                      print(value);
                      if(value == 200 ) {
                        print("in if ");
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Main() ));

                        Fluttertoast.showToast(
                            msg: "Article ajouté avec succès",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    });

                    // Navigator.pop(context);
                  }
                },
                child: Text('Ajouter'),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Annuler'),
              ),

            ),
          ]
        )
      ),
    );
  }


  Future ajoutArticle(String type, String description, String id) async {
    var url = 'http://74.208.37.86:9088/textprixdist';
    var response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'type': type,
        'description': description,
        'id': id,
      }),
    );
    print("la reponse ${response.statusCode}");
    print("le body ${response.body}");
    if(response.statusCode==200){
      print("Article crée avec succes");
      return response.statusCode;
    }
  }

}