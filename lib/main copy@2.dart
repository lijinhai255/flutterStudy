import 'package:flutter/material.dart';
// import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container_p7(),
    );
  }
}

class Container_p7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color:Colors.green,
      child: Column(
        children: <Widget>[
          // new Image.asset('images/reg-bg11@3x.png',width: 500,height: 100,),
          // new Image.network("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1906469856,4113625838&fm=26&gp=0.jpg"),
          new FadeInImage.assetNetwork(
            placeholder: "images/reg-bg11@3x.png",
            image: "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1906469856,4113625838&fm=26&gp=0.jpg",
            fit: BoxFit.fitWidth,
          )
        ],
          
      )
    );
    
  }
}