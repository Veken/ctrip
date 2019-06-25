import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget{
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  static const citys = {
    '北京':['东城区','西城区','北城区','南城区'],
    '上海':['东城区','西城区','北城区','南城区'],
    '深圳':['东城区','西城区','北城区','南城区'],
    '广州':['东城区','西城区','北城区','南城区'],
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ListView(
          children: _buildList(),
        ),
      )
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    citys.keys.forEach((key){
      widgets.add(_item(key,citys[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(
        city,
        style: TextStyle(color: Colors.blue),
      ),
      children: subCities.map((subCity)=>_buildSub(subCity)).toList(),
    );
  }

  Widget _buildSub(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(subCity),
      ),
    );
  }


}