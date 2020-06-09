import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:uft8';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("List View使用"),
          centerTitle: false,
        ),
        body: CustomListView(),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  var httpClient = new HttpClient();
  var url = "https://randomuser.me/api/?results=30";
  _loadDate() async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    // if (response.statusCode == HttpStatus.OK) {
      var json = await response.transform(utf8.decoder).join();
    //   var data = jsonDecode(json);
    //   result = data['origin'];
    // } else {
    //   result = 'Error getting IP address:\nHttp status ${response.statusCode}';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: getListView3(),
    );
  }
  //方式一
  // 数据量小 相对固定
  // getListView1(){
  //   return new ListView(
  //     padding: EdgeInsets.all(10),
  //     children: <Widget>[
  //       Text("Row1"),
  //       Text("Row2"),
  //       Text("Row3"),
  //       Text("Row1"),
  //       Text("Row2"),
  //       Text("Row3"),
  //       Text("Row1"),
  //       Text("Row2"),
  //       Text("Row3"),
  //     ],
  //   );

  // }
  //方式二
  getListView2() {
    return new ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        // return Text('$index');
        return ListTile(
            title: Text('title$index'), subtitle: Text('subTitle$index'));
      },
    );
  }

  //方式三
  getListView3() {
    return new ListView.separated(
      padding: EdgeInsets.all(10),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        // return Text('$index');
        return ListTile(
            title: Text('title$index'), subtitle: Text('subTitle$index'));
      },
      separatorBuilder: (BuildContext context, int index) {
        // return Text('$index');
        return Divider(
          height: 1,
          color: Colors.grey,
        );
      },
    );
  }
}
