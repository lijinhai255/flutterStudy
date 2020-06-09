
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FriendListPage extends StatefulWidget{

  @override
  _FriendListPageState createState()=> new _FriendListPageState();




}
class _FriendListPageState extends State<FriendListPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('好友列表'),),
      body: new Center(
        child: Text("12121")
      ),
    );
  }

}
