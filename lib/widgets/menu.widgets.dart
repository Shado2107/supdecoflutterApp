import 'package:flutter/material.dart';
import 'package:projet_flutter/view/acceuil.view.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Acceuil"),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Acceuil()));
            },
          )
        ],
      )
    );
  }


}