import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

//url that you want to open
const URL="https://www.google.co.in/";

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title:"URL Launcher",
      theme: ThemeData.dark(),
      home: Home(),

    );
  }
}

class Home extends StatefulWidget{
  @override 
  HomeState createState()=> HomeState();
}
class HomeState extends State<Home>{

  //method to launch url on onpress
  Future launchURL(String url) async{
    if(await canLaunch(url)){
      await launch(url,forceSafariVC: true,forceWebView: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Launcher"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(URL),),
              RaisedButton(
                child: Text("Open Link"),
                onPressed: (){
                  launchURL(URL);
                },)
          ],
        ),),
    );
  }
    

}