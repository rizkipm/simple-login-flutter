import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'page_3.dart';

class PageSimpleLogin extends StatefulWidget {
  @override
  _PageSimpleLoginState createState() => _PageSimpleLoginState();
}

class _PageSimpleLoginState extends State<PageSimpleLogin> {

  //retrieve value
  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();

  String nUsername = "", nPassword = "";
  String dataUsername = "vener";
  final String dataPassword = "vener123";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Simple Login'),
        backgroundColor: Colors.red,
      ),

      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(7.0),
            child: TextFormField(
              controller: etUsername,
              decoration: InputDecoration(
                hintText: 'Username'
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(7.0),
            child: TextFormField(
              controller: etPassword,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
          ),

          Container(
            child: InkWell(
              child: Text('Test'),
              onTap: (){

              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(7.0),
            child: MaterialButton(
              child: Text('Submit'),
              onPressed: (){

                setState(() {
                  nUsername = etUsername.text;
                  nPassword = etPassword.text;

                  if((nUsername == dataUsername) && (nPassword == dataPassword)){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        PageKetiga(username: nUsername, password: nPassword,)
                    ));
                  }else{
                    Fluttertoast.showToast(
                    msg: "Username atau Password anda salah !",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                  }


                });
//
                print("username : " + etUsername.text);
                print("password : " + etPassword.text);
              },
              color: Colors.red,
              textColor: Colors.white,
            ),
          ),

          Container(
            margin: EdgeInsets.all(7.0),
            child: Text('Username anda : ' + nUsername),
          ),

          Container(
            margin: EdgeInsets.all(7.0),
            child: Text('Password anda : ' + nPassword),
          ),


        ],
      ),
    );
  }
}
