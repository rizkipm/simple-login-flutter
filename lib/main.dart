import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'simple_login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PageHome(),
    );
  }
}

const List<Key> keys = [
  Key("Network"),
  Key("NetworkDialog"),
  Key("Flare"),
  Key("FlareDialog"),
  Key("Asset"),
  Key("AssetDialog")
];
class PageHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Page Home Day 2'),
        backgroundColor: Colors.red,
      ),

      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('Notification Widget & Retrieve Value'),
              ),

            Container(
              margin: EdgeInsets.only(top: 45.0),
              child: MaterialButton(
                onPressed: (){
                  Fluttertoast.showToast(
                    msg: "This is Center Short Toast",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );},
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                  'Toast'
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 45.0),
              child: MaterialButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (_) => NetworkGiffyDialog(
                        key: keys[1],
                        image: Image.network(
                          "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          'Granny Eating Chocolate',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600),
                        ),
                        description: Text(
                          'This is a granny eating chocolate dialog box. This library helps you easily create fancy giffy dialog.',
                          textAlign: TextAlign.center,
                        ),
                        onOkButtonPressed: () {},
                      ));

//                  return showDialog(context: context, builder: (context){
//                    return AlertDialog(
//                      content: Text("Ini adalah alert dialog"),
//                    );
//
//                  });
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                    'Alert Dialog'
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 45.0),
              child: MaterialButton(
                onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> PageStateful()));
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                    'Snackbar'
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 45.0),
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PageSimpleLogin()));
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                    'Simple Login Page'
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}

class PageStateful extends StatefulWidget {
  @override
  _PageStatefulState createState() => _PageStatefulState();
}

class _PageStatefulState extends State<PageStateful> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Are you talkin\' to me?'));
    _scaffoldkey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('SnackBar Page'),
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: MaterialButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text(
            'Please Press this bottom'
          ),
          onPressed: (){
          _displaySnackBar(context);
          },
        ),
      ),
    );
  }
}


