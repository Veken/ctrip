import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ctrip/constant/image_url_constant.dart';
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List _imageUrls = [
    Constant.ASSETS_IMAGE+"banner1.jpg",
    Constant.ASSETS_IMAGE+"banner2.jpg",
    Constant.ASSETS_IMAGE+"banner3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 160,
              child: Swiper(
                  itemCount: _imageUrls.length,
                  autoplay: true,
                  itemBuilder: (BuildContext context,int index){
                    return new Image.asset(_imageUrls[index]);
                  },
                pagination: SwiperPagination(),
              ),//Swiper
            )//Container
          ],//Widget
        ),//Column
      ),//Center
    );//Scaffold
  }

}