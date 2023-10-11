// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String usernamex ="";
String emailx ="";
String email2 ="";
String profilex ="";

class MainNrc extends StatelessWidget {
  const MainNrc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text("NRC System App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("National Research Centre"),
            SizedBox(
              height: 15,
            ),
            Image.network(
              'http://learnflutter.orgfree.com/images/NRC_11.jpg',
              width: 350,
              height: 350,
              // fit: BoxFit.cover,
            ),
          

                    SizedBox(height: 70),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Colors.red,
                  ),
                   SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.internetExplorer,
                    color: Colors.blue,
                  ),

              ],
            ),
          
               SizedBox(height: 30),
              Text("Computer & It  Management",
              style:TextStyle(color: Colors.purple
              )
              ),

              ],
        ),
      ),
    );
  }
}
