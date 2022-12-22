import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projet_flutter/view/ajoutArticle.view.dart';
import 'package:projet_flutter/view/detail.view.dart';
import '../widgets/menu.widgets.dart';

import 'package:http/http.dart' as http;


class Acceuil extends StatefulWidget {
  @override
  State<Acceuil> createState() => _ArticleState();
}

class _ArticleState extends State<Acceuil>{
  List <dynamic> listArticle = [];

  @override
  void initState() {
    super.initState();
    getListArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: MyDrawer(


      ),

      appBar: AppBar(
        title: Text("acceuil"),
      ),

      body: Center(

        child: ListView.separated(separatorBuilder: (context, index) => const Divider(height: 5,color: Colors.black,),
          itemCount:  listArticle.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                print(listArticle[index] );
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Details(articleData:listArticle[index], description:listArticle[index]["description"]) ) );
              },
              title: InkWell(
                child: Text("${listArticle[index]["type"]}"),
              ),
              subtitle: Text("${listArticle[index]["description"]}"),
              trailing: Text("${listArticle[index]["description"]}"),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>AjoutArticle() ) );
        },
      ),
    );
  }

  Future getListArticle() async {
    var url = 'http://74.208.37.86:9088/textprixdist';
    print(url);
    var reponse = await http.get(Uri.parse(url));
    setState(() {
      print("la reponse ${reponse.statusCode}");
      print("le body ${reponse.body}");
      if(reponse.statusCode ==200){
        listArticle = json.decode(reponse.body);
      }
    });
  }

}