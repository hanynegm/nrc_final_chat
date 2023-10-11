// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_interpolation_to_compose_strings
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/main_nrc.dart';
import 'package:flutter_dbase_mysql/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState(); 
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List list = [];
  
    Future readUser() async {
  
            var apiEndpoint = "http://learnflutter.orgfree.com/get_user.php";
            // var res = await http.get(apiEndpoint as Uri, headers: {"Accept:": "appliication/json"});

            final Uri url = Uri.parse(apiEndpoint);
            http.Response response = await http.post(url, body: {
              'username': _usernameController.text,
              'password': _passwordController.text,
            });

            if (response.statusCode == 200) {
                      var data1 =utf8.decode(response.bodyBytes);
                      var jsonData = jsonDecode(data1);
                if(jsonData.hashCode != 2011){
                    setState(() {
                      list = jsonData;
                      usernamex = list[0]['username'];
                      emailx =list[0]['email'];
                      profilex = list[0]['imagename'];
                                   
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainNrc(),
                        ),     
                      );      
                    } );
                } else {
                    showDialog(
                        context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text("Invalid username or password"),
                      actions: [
                            TextButton(
                            onPressed: () => Navigator.pop(context),
                  
                            child: Text("OK"),
                            ),
                      ]
                      ),
                    );
                }



            } 



      }
      

    



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("NRC System App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        
        child: Padding(  
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('National Reseaech Center',
              style: TextStyle(fontSize: 25,color: Colors.blue[800],fontWeight:FontWeight.bold),),
            SizedBox(height: 15,),
              Text('Login',
              style: TextStyle(fontSize: 18,color: Colors.blue),),
            SizedBox(height: 15,),
              Image.network(
                'http://learnflutter.orgfree.com/images/login.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
                SizedBox(height: 15),
        
                Container(
                height: 38,
                child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    ),
                    ),
                 SizedBox(height: 10),
        
                Container(
                height: 38,
                child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    ),
                    ),
          
              SizedBox(height: 10),
        
              ElevatedButton(
                onPressed: readUser,
                child: Text("Login"),
              ),
              SizedBox(height: 20),
              
              Center(
                child: Row(
                  children: [
                    Text('Do not have an Acount  ',style: TextStyle(fontSize: 12),),
                    TextButton(onPressed: (){
                         Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                    },
                    
                     child: Text("Sign up"),
                     ),
                  ],
                ),
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
          
               SizedBox(height: 20),
               Text("Computer & It  Management",
              style:TextStyle(color: Colors.purple
              )
              ),
 
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Welcome to the Home Screen!"),
      ),
    );
  }
}
