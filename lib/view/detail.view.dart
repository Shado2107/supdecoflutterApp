import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:projet_flutter/main.dart';
import 'package:projet_flutter/view/acceuil.view.dart';
import 'package:http/http.dart' as http ;



class Details extends StatelessWidget {
  //const Details({Key? key}) : super(key: key);

  dynamic articleData;
  String? description;
  Details( {this.articleData, this.description });
  TextEditingController typeController = TextEditingController ();
  TextEditingController descriptionController = TextEditingController ();
  TextEditingController idController = TextEditingController ();
  TextEditingController dateController =  TextEditingController();
  TextEditingController dateFinController =  TextEditingController();


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    print(articleData);
    typeController.text = articleData["type"].toString();
    descriptionController.text = articleData["description"].toString();
    idController.text = articleData["id"].toString();
    dateController.text =  articleData["date"].toString();
    dateFinController.text =  articleData["dateFin"].toString();

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

      body: Center(
        child: Container(
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50.0,
                  width: 1000.0,

                  child: ListTile(
                    title: Text("description"),
                    trailing: Text("${descriptionController.text}"),
                  ),

                ),
                Container(
                  height: 50.0,
                  width: 1000.0,

                  child: ListTile(
                    title: Text("Type"),
                    trailing: Text("${typeController.text}"),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 1000.0,

                  child: ListTile(
                    title: Text("Date"),
                    trailing: Text("${dateController.text}"),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 1000.0,

                  child: ListTile(
                    title: Text("DateFin"),
                    trailing: Text("${dateFinController.text}"),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 1000.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          child: Text("Annuler"),
                          onPressed:(){
                            print("Annuler ");

                            Navigator.pop(context);
                          }
                      ),
                      SizedBox(width: 10.0),

                      ElevatedButton(
                          child: Text("Supprimer"),
                          onPressed:(){
                            print("Supprimer");
                            // print("${idController.text }");
                            supprimerArticle(int.parse(idController.text.toString()));
                          }
                      )

                    ],
                  ),

                ),
              ]
            )
          )
        )
      )

    );
  }

  Future supprimerArticle(int id) async {
    print(id);
    var url = 'http://74.208.37.86:9088/textprixdist/${id}';
    print(url);
    var reponse = await http.delete(Uri.parse(url));
    //setState(() {

    print("La reponse  ${reponse.statusCode}");
    print("Le body  ${reponse.body}");
    if( reponse.statusCode ==200){
      //listEtudiant = json.decode(reponse.body) ;
    }

    // });

  }

}
