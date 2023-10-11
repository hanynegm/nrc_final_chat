// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dbase_mysql/main_nrc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 File? _file;
  late File uploadimage;
  ImagePicker image = ImagePicker();
  String imgstr = "";
  String? imagepath;
  //String? imagename;
  String? imagename;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _fullname = TextEditingController();

Future get_gallrey() async {
    // ignore: deprecated_member_use
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null){
        setState(() {
            _file = File(img.path);
           // imagepath = _file!.path;
        });
         imagename = _file!.path.split("\\").last;
     // String newname = _file!.path.split(".").last;
    //  newname = _fullname.text + '.' + newname;
      imagepath = _file!.path;
       imgstr = base64Encode(_file!.readAsBytesSync());
   
       // print(imgstr); 
        //return imgstr;
    } else{
      return null;
    }
}
   

Future get_camera() async {
    // ignore: deprecated_member_use
    final img = await ImagePicker().pickImage(source: ImageSource.camera);
     if (img != null){
        setState(() {
            _file = File(img.path);
            //imagepath = _file!.path; 
        });
        imagename = _file!.path.split("\\").last;
     // String newname = _file!.path.split(".").last;
     // newname = _fullname.text + '.' + newname;
      imagepath = _file!.path;
        imgstr = base64Encode(_file!.readAsBytesSync());
       // print(imgstr); 
       // return imgstr;
    } else{
      return null;
    }
}

   


Future adduser()async{
    try{
        print(imagename);

      var apiEndpoint = "http://learnflutter.orgfree.com/insertuser.php";

      final Uri url = Uri.parse(apiEndpoint);
      var data = {
        'fullname' : _fullname.text,
        'username' : _username.text,
        'password' : _password.text,
        'email' : _email.text,
        'image' : imgstr,
        'imagename' : imagename,
        'imagepath' : imagepath,

      };

      var response = await http.post(url, body: data);
      if(response.statusCode == 200){
        print('Inserted Row');
        print(imagepath);
        print(imagename);
      }else{
        print('No Insert');
      }



    }catch(e){

      print (e);
    }

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("NRC System App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'National Reseaech Center',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 8,),
            Text(
              "Registration",
              style: TextStyle(fontSize: 18, color: Colors.blue), 
            ),
            SizedBox(height: 8,),
            Image.network(
              'http://learnflutter.orgfree.com/images/unlock.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          
            SizedBox(height: 8),
          
            Container(
              height: 33,
              child: TextFormField(
                controller: _fullname,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Fullname',
                ),
              ),
            ),
           
            SizedBox(height: 8),
           
            Container(
              height: 33,
              child: TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
           
            SizedBox(height: 8),
           
            Container(
              height: 33,
              child: TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
           
            SizedBox(height: 8),
           
            Container(
              height: 33,
              child: TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                
              ),
            ),
           
            SizedBox(height: 8),
            
            Container(
              height: 33,
              child: TextFormField(
                controller: _phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
                obscureText: true,
              ),
            ),
           
            SizedBox(height: 8),
               Row(
                 children: [
                   Container(
                    height: 70,
                    width: 70,
                    color: Colors.black12,
                    child: _file == null
                          ? Icon(Icons.image,
                              size: 50,
                          )
                          : Image.file(
                            _file!,
                            fit: BoxFit.cover,
                          ),   
                   ),
                   SizedBox(width: 5),
                   MaterialButton(
                    onPressed: (){
                        get_gallrey();
                    },
                    child: Text('Gallery',style: TextStyle(color:Colors.white),),
                    color: Colors.blue[900],
                   ),

                    SizedBox(width: 5),
                   MaterialButton(
                    onPressed: (){
                        get_camera();
                    },
                    child: Text('Camera',style: TextStyle(color:Colors.white),),
                    color: Colors.blue[900],
                   ),

                 //  imgstr == null ? Text("No Image Selected") : Container(child:Text('image'),),
                 ],
               ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    adduser();
                    },
                  child: Text("Registration"),
                ),
              
                SizedBox(width: 20),

                 ElevatedButton(
                  onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainNrc(),
                        ),
                      );
                  },
                  child: Text("Exit"),
                  ),
              ],
                ),
                       
            SizedBox(height: 20),
            
            Center(
              child: Row(
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
            ),
           
           SizedBox(height: 30),
             Text("Computer & It  Management",
              style:TextStyle(color: Colors.purple
              )
              ),
          ]   
        
      ),
    ),
    );
  }

}