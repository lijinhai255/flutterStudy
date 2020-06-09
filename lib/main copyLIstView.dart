import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('listView的使用'),
          centerTitle: true,
        ),
        body: CustomListView(),
      )
    );
  }
}

class CustomListView extends StatelessWidget {

  var httpClient = new HttpClient();
  var url = 'https://randomuser.me/api/?results=30';

  _loadData() async {

    var resquest = await httpClient.getUrl(Uri.parse(url));
    var response = await resquest.close();
    var result = await response.transform(utf8.decoder).join();

    print(result);

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: getListView3(),
    );
  }

  //方式一：
  //适用于数据量小切相对固定的数据
  getListView1() {
    return new ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        Text('Row1'),
        Text('Row2'),
        Text('Row3'),
        Text('Row1'),
        Text('Row2'),
        Text('Row3'),
        Text('Row1'),
        Text('Row2'),
        Text('Row3'),
      ],
    );
  }

  getListView2() {
    return new ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index){
        // return Text('$index');

        return ListTile(
          title: Text('title$index'),
          subtitle: Text('subTitle$index'),
          // leading: ,
        );
      },
    );
  }

  getListView3() {
    
    _loadData();
    
    return new ListView.separated(
      padding: EdgeInsets.all(10),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index){
        // return Text('$index');

        return ListTile(
          title: Text('title$index'),
          subtitle: Text('subTitle$index'),
          // leading: ,
        );
      },
      separatorBuilder: (BuildContext context, int index){
        return Divider(
          height: 0.5,
          color: Colors.grey,
        );
      },
    );
  }

  //网络加载

  

}
