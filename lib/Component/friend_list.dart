
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FriendListPage extends StatefulWidget{

  @override
  _FriendListPageState createState()=> new _FriendListPageState();

}
class _FriendListPageState extends State<FriendListPage>{
   var url = 'https://randomuser.me/api/?results=25';
  //（1）创建httpClient
  var httpClient = new HttpClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 网络加载
     //网络加载
    _loadFriendsData();
  }
  _loadFriendsData()async{
    //(2)打开http连接，设置请求头
     HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
     //(3)等待连接服务器
    HttpClientResponse response = await request.close();

     if(response.statusCode == 200) {
      var jsonString = await response.transform(utf8.decoder).join();
      var json = jsonDecode(jsonString);
      print(json);
  
    }

    //请求结束，关闭httpClient
    httpClient.close();

  }

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
