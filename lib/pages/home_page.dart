import 'package:ctrip/dao/home_dao.dart';
import 'package:ctrip/model/common_model.dart';
import 'package:ctrip/model/home_model.dart';
import 'package:ctrip/widget/local_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ctrip/constant/image_url_constant.dart';

const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List _imageUrls = [
    Constant.ASSETS_IMAGE+'banner1.jpg',
    Constant.ASSETS_IMAGE+'banner2.jpg',
    Constant.ASSETS_IMAGE+'banner3.jpg',
  ];
  double appBarAlpha = 0;
  String resultString = "";
  List<CommonModel> localNavList = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //Stack类似于Android中的Framlayout, 下面的widget会叠在上面的widget上层
      body: Stack(
        children: <Widget>[
        //移除控件的padding
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          //滚动监听
          child:NotificationListener(
            onNotification: (scrollNotification){
              //如果是正在滚动，需要去监听的判断，有时候如果没有滚动也会回调，优化性能；
              // 第0个元素（ListView）的时候才触发滚动监听，避免造成Swiper在滚动的时候，也触发了滚动监听
              if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth==0){
                _onScroll(scrollNotification.metrics.pixels);
              }
            },
            child: ListView(
              children: <Widget>[
                Container(
                  height: 160,
                  //第三方轮播图Banner=>Swiper
                  child: Swiper(
                    itemCount: _imageUrls.length,
                    autoplay: true,
                    itemBuilder: (BuildContext context,int index){
                      return new Image.asset(_imageUrls[index]);
                    },
                    //轮播图指示器
                    pagination: SwiperPagination(),
                  ),//Swiper
                ),//Container
                Padding(
                  child:  LocalNav(localNavList: localNavList,),
                  padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                )
                ,Container(
                  height: 800,
                  child: ListTile(
                    title: Text(resultString),
                  ),
                )
              ],//Widget
            ),//Column
          ),//Center
        ),//ListView
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
              ),//Padding
            ),//Center
          ),//Container
        ),//Opacity
      ],)

    );//Scaffold
  }

  _onScroll(offset) {
    double alpha = offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha = 0;
    }else if(alpha>1){
      alpha = 1;
    }else{
      setState(() {
        appBarAlpha = alpha;
      });
    }
    print(appBarAlpha);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async{
//    HomeDao.fetch().then((result){
//      setState(() {
//        resultString = json.encode(result);
//      });
//    }).catchError((e){
//      setState(() {
//        resultString = e.toString();
//      });
//    });
    try{
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
      });
    }catch(e){
      print(e);
    }
  }

}