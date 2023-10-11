//import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dbase_mysql/main_nrc.dart';
import 'package:flutter_dbase_mysql/users_chat.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  static const String screenRout = 'chat_screen';
  
  const ChatScreen({Key? key}) :super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // final _auth = FirebaseAuth.instance;
  // late User signdInUser;
  TextEditingController txtpost = TextEditingController();
  late String post;
  List list_posts = [];
  
  Future get_posts()async{
    try {
      
         var apiEndpoint = "http://learnflutter.orgfree.com/get_posts.php";
        final Uri url = Uri.parse(apiEndpoint);
        var data = {
        'email1' : emailx.toString(),
        'email2' : email2.toString(),
         };
        http.Response response = await http.post(url, body: data);
    if (response.statusCode == 200) {
        var data1 = utf8.decode(response.bodyBytes);
        var jsonData = jsonDecode(data1);
      //return jsonData;
      setState(() {
        list_posts = jsonData;
        print(list_posts);
        print(emailx);
      });
    } else {
      print('No Data Found');
    }


    } catch (e) {
      print(e);
    }
  }


  // add post
  Future addpost()async{
    try{
      
      var apiEndpoint = "http://learnflutter.orgfree.com/insertpost.php";

      final Uri url = Uri.parse(apiEndpoint);
      var data = {
        'username' : usernamex.toString(),
        'email1' : emailx.toString(),
        'email2' : email2.toString(),
        'post' : post.toString(),
       
      };

      var response = await http.post(url, body: data);
      if(response.statusCode == 200){
        print('Inserted Row');
       
      }else{
        print('No Insert');
      }



    }catch(e){

      print (e);
    }

}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    get_posts();
  }

  // void getCurrentUser(){
  //   try{
  //       final user = _auth.currentUser;
  //       if(user != null){
  //         signdInUser = user;
  //         print(signdInUser.email);
  //       }
  //   } catch(e){
  //     print(e);
  //   }
  //    }

  @override
  Widget build(BuildContext context) {
    var widthx = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        leading: IconButton(
          iconSize: 20,
          icon:Icon(Icons.skip_previous),
          onPressed: (){
             Navigator.of(context).pop();
              Navigator.push(context,
                 MaterialPageRoute(builder: (context) => UsersChat()));

          }),
        title: Row(
          children: [
                const Icon(Icons.chat),
              //    Image.network(
              //   'http://learnflutter.orgfree.com/images/chat.png',
              //   width: 25,
              //   height: 25,
              //   fit: BoxFit.cover,
              // ),
               const SizedBox(width: 10),
               const Text('Chat with Us'),
          ], 
        ),
        actions: [
          IconButton(
            onPressed: (){},
             icon: Icon(Icons.close),
             )
        ],
      ),

      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
           // padding: EdgeInsets.all(10),
          //  contentPadding:const EdgeInsets.all(5),
              child: Expanded(
                
                child: ListView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                 // padding: EdgeInsets.all(10),
                 // crossAxisAlignment:CrossAxisAlignment.end,
                //  shrinkWrap: true,
                  itemCount: list_posts.length,
                  itemBuilder: (context, i){
                    Padding:const EdgeInsets.all(20);
                    // crossAxisAlignment:
                    //   emailx == list_posts[i]['email'] ? CrossAxisAlignment.end : 
                    //   CrossAxisAlignment.start;
                   return ListTile(
                    
                         title: Text(list_posts[i]['post'],
                         style: TextStyle(
                          backgroundColor: emailx == list_posts[i]['email1'] ?
                          Color.fromARGB(255, 207, 229, 238):Color.fromARGB(255, 242, 244, 247)),
                           textAlign: emailx == list_posts[i]['email1'] ? 
                           TextAlign.right : TextAlign.left,
                           
                            ),
                          subtitle : Text(list_posts[i]['email1'],textAlign: emailx == list_posts[i]['email1'] ? 
                         TextAlign.right : TextAlign.left,
                          ),

                        // : title: Text(list_posts[i]['email'],textAlign: TextAlign.left) 
                         
                     // subtitle: Text(list_posts[i]['post'],textAlign: TextAlign.right)):
                      
                        
                      
                   );
                    // return const Padding(
                    //   padding: EdgeInsets.all(15),
                      
                    //  child: ListTile(
                    //   title: Text(list_posts[i]['email'],textAlign: TextAlign.right),
                    //  ) 
                           
                    
                    // );
                  }),
              ),
          ),
          
          Container(
            
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.orange,
                  width: 2,
                ),
              ),
            ),  
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: TextField(
                  controller: txtpost,
                 
                  onChanged: (value){
                      post = value;
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    hintText: 'Write Your Message here ...',
                    border: InputBorder.none,
                  ),
                ),
                ),

                TextButton(
                  onPressed: (){
                    print(usernamex);
                    print(emailx);
                    print(post);
                    if (txtpost.text !="") {
                       addpost();
                       }else {
                          print("Enter The post");
                       }
                    
                   
                    get_posts();
                    txtpost.text = "";
      
                  },
                  child: Text(
                  'send',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,  
                  ),
                  ),
                  )
              ],
            ), 
          ),
        ],
      )
      ),
    );
  }
}