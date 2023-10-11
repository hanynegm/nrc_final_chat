import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dbase_mysql/chat.dart';
import 'package:flutter_dbase_mysql/main_nrc.dart';
import 'package:http/http.dart' as http;



class UsersChat extends StatefulWidget {
  const UsersChat({super.key});

  @override
  State<UsersChat> createState() => _UsersChatState();
}

class _UsersChatState extends State<UsersChat> {
List list_all_users = [];
String? userimage ;

  Future get_allusers()async{
    try {
      
         var apiEndpoint = "http://learnflutter.orgfree.com/get_all_users.php";
        final Uri url = Uri.parse(apiEndpoint);
         var data = {
        'email1' : emailx.toString(),
      };
        http.Response response = await http.post(url, body: data);
    if (response.statusCode == 200) {
        var data1 = utf8.decode(response.bodyBytes);
        var jsonData = jsonDecode(data1);
      //return jsonData;
      setState(() {
        list_all_users = jsonData;
        print(list_all_users);
        print(emailx);
      });
    } else {
      print('No Data Found');
    }


    } catch (e) {
      print(e);
    }
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_allusers();
  }
  @override
  Widget build(BuildContext context) {
    var widthx = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
                title: Text("All Users"),
                centerTitle: true,
        ),
        
        body: Container(
          padding: EdgeInsets.only(top: 20),
           width: widthx ,
          //color: Colors.amber,
          child: ListView.builder(
            itemCount: list_all_users.length,
            itemBuilder: (context,i){
              userimage = list_all_users[i]['imagename'];
              return ListTile(

                leading: CircleAvatar(
                      child: ClipOval(
                      child:Image.network(
                            'http://learnflutter.orgfree.com/users_images/$userimage',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                
                      ) 
                      ),
                      ),
                title: Text(list_all_users[i]['email']),      
                subtitle: Text(list_all_users[i]['fullname']),
                trailing: Icon(Icons.message),
                onTap: () {
                  email2 = list_all_users[i]['email'];
               Navigator.of(context).pop();
              Navigator.push(context,
                 MaterialPageRoute(builder: (context) => ChatScreen()));
            },
              );
            },
            ),
        ),
    );
  }
}