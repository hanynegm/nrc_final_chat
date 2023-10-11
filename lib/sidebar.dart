// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/chat.dart';
import 'package:flutter_dbase_mysql/institute_screen.dart';
import 'package:flutter_dbase_mysql/login.dart';
import 'package:flutter_dbase_mysql/main_nrc.dart';
import 'package:flutter_dbase_mysql/news_screen.dart';
import 'package:flutter_dbase_mysql/users_chat.dart';
import 'package:url_launcher/url_launcher.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Center(
            child:
            
            UserAccountsDrawerHeader(
            
            accountName:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
              Text('$usernamex'),
            ]) ,
             
            accountEmail:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
              Text('$emailx'),
            ]) ,

            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child:Image.network(
                'http://learnflutter.orgfree.com/users_images/$profilex',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                
                ) 
              ),
            ),
           
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        
          ),
          ListTile(
            leading: Icon(Icons.home),
            iconColor: Colors.blue[600],
            title: Text(
              'Home',
              style: TextStyle(color: Colors.blue[600]),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainNrc()));
              
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            iconColor: Colors.blue[600],
            title: Text('News', style: TextStyle(color: Colors.blue[600])),
            onTap: () {
               Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsScreen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.email,
            ),
            iconColor: Colors.blue[600],
            title: Text(
              'Email',
              style: TextStyle(color: Colors.blue[600]),
            ),
            onTap: () {
               Navigator.of(context).pop(); 
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InstituteScreen()));
            },
            
          ),
          ListTile(
            leading: Icon(Icons.chat),
            iconColor: Colors.blue[600],
            title: Text('Chat', style: TextStyle(color: Colors.blue[600])),
            onTap: () {
               Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UsersChat()));
            },
          ),
         
            ListTile(
            leading: SizedBox(
              child: Image.network(
                            'http://learnflutter.orgfree.com/users_images/Ethics_committee.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                
                      ) ,
                      ),
            
            title: Text('NRC Ethics committee', style: TextStyle(color: Colors.blue[600])),
            onTap: () {
               Navigator.of(context).pop();
              final url = 'https://nrc-mrec.online/';
                        final Uri url1 = Uri.parse(url);
                        launchUrl(url1 , mode: LaunchMode.inAppWebView);
            },
          ),


           ListTile(
            leading: Icon(Icons.settings_applications),
            iconColor: Colors.blue[600],
            title: Text('NRC System', style: TextStyle(color: Colors.blue[600])),
            onTap: () async {
               Navigator.of(context).pop();
              final url = 'http://10.101.0.24/nrc/login/login.aspx';
                        final Uri url1 = Uri.parse(url);
                        launchUrl(url1 , mode: LaunchMode.inAppWebView);
            },
          ),
         
          ListTile(
            leading: Icon(Icons.logout),
            iconColor: Colors.blue[600],
            title: Text('Logout', style: TextStyle(color: Colors.blue[600])),
            onTap: () {
               Navigator.of(context).pop();
              Navigator.push(context,
                 MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),

            ListTile(
            leading: Icon(Icons.logout),
            iconColor: Colors.blue[600],
            title: Text('Admin Web', style: TextStyle(color: Colors.blue[600])),
            onTap: () async {
               Navigator.of(context).pop();
              final url = 'https://www.nrc.sci.eg/admin';
                        final Uri url1 = Uri.parse(url);
                        launchUrl(url1 , mode: LaunchMode.inAppWebView);
            },
          ),
        ],
      ),
    );
  }
}
